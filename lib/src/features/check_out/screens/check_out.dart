import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_models/product.dart';
import '../../../common_models/order.dart';
import '../../../common_models/cart.dart';
import '../../../common_models/user.dart';

import '../../../common_widgets/cta_button.dart';
import '../../../common_widgets/adjust_quantity.dart';

import 'order_success.dart';
import '../../shop/widgets/product_card.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../authentication/controllers/auth_controller.dart';
import '../../../utilities/theme.dart';

class CheckOutScreen extends StatefulWidget {
  final CartController cartController;
  RxInt totalPrice = 0.obs;

  CheckOutScreen({required this.cartController});

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final AuthController _authController = Get.find();
  double finalPrice = 0;
  CartFirebase? _cart;
  bool paymentControl = false;
  RxString paymentText = 'CASH'.obs;
  RxString selectedAddress = ''.obs;
  List<String> addresses = [];
  UserFirebase? user;

  @override
  void initState() {
    super.initState();
    loadCart();
    fetchAddress();
  }

  Future<void> loadCart() async {
    final cartData =
        await CartFirebase.getCartByUserUID(_authController.uid.toString());
    setState(() {
      _cart = cartData;
    });
    widget.totalPrice.value =
        widget.cartController.calculateTotalPrice(_cart!.cartProducts).toInt();
  }

  Future<void> fetchAddress() async {
    user = await UserFirebase.getUserById(_authController.uid.value);
    if (user != null) {
      addresses = user!.addresses;
      print(addresses);
    }
    selectedAddress.value = addresses[0];
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        width: 480,
        height: 800,
        child: Column(
          children: [
            Container(
              height: 64,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'YOUR ORDER',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.black.withOpacity(0.8)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ListView.builder(
                  itemCount: _cart!.cartProducts.length,
                  itemBuilder: (context, index) {
                    final cartProduct = _cart!.cartProducts[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 16,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 12,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () async {
                            final product =
                                await ProductFirebase.getProductById(
                                    cartProduct.productUID);
                            Get.toNamed(
                              '/product_detail',
                              arguments: product,
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  children: [
                                    Image.network(
                                      cartProduct.productImage,
                                    ),
                                    Positioned(
                                      top: 2,
                                      right: 8,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() async {
                                            final cartId =
                                                _authController.uid.toString();
                                            final cart = await CartFirebase
                                                .getCartByUserUID(cartId);

                                            cart!.cartProducts.removeAt(index);
                                            await cart.update();
                                            loadCart();
                                            widget.totalPrice.value = widget
                                                .cartController
                                                .calculateTotalPrice(
                                                    _cart!.cartProducts)
                                                .toInt();
                                          });
                                        },
                                        child: Container(
                                          height: 32,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      cartProduct.productName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(color: Colors.black),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Version: ${cartProduct.versionName}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(color: Colors.black),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 24),
                                    SizedBox(
                                      width: 316,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${cartProduct.price.toStringAsFixed(2)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          AdjustableQuantity(
                                            initialValue:
                                                cartProduct.amount.toInt(),
                                            onChanged: (quantity) async {
                                              widget.cartController
                                                  .updateProductQuantity(
                                                cartProduct.productUID,
                                                cartProduct.versionName,
                                                quantity,
                                                _cart!.cartProducts,
                                              );
                                              setState(() {
                                                cartProduct.amount =
                                                    quantity.toDouble();
                                              });
                                              await _cart!.update();
                                              widget.totalPrice.value = widget
                                                  .cartController
                                                  .calculateTotalPrice(
                                                      _cart!.cartProducts)
                                                  .toInt();
                                            },
                                            textSize: 14,
                                            buttonSize: 24,
                                            iconSize: 16,
                                            distance: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOTAL: '),
                        Obx(() => Text(
                              '\$${widget.totalPrice.value.toStringAsFixed(2)}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('PAYMENT METHOD : '),
                        InkWell(
                          onTap: () {},
                          child: PopupMenuButton(
                            offset: const Offset(0, -120),
                            itemBuilder: (BuildContext context) {
                              return <PopupMenuEntry>[
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.money),
                                    title: Text(
                                      'CASH',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      setState(
                                          () => paymentText.value = 'CASH');
                                    },
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.credit_card),
                                    title: Text(
                                      'CREDIT',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      setState(
                                          () => paymentText.value = 'CREDIT');
                                    },
                                  ),
                                ),
                              ];
                            },
                            child: Row(
                              children: [
                                Text(
                                  paymentText.value,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ADDRESS : '),
                        InkWell(
                          onTap: () {},
                          child: PopupMenuButton(
                            clipBehavior: Clip.hardEdge,
                            offset: const Offset(0, -160),
                            itemBuilder: (BuildContext context) {
                              return addresses.map((address) {
                                return PopupMenuItem(
                                  child: ListTile(
                                    title: Text(
                                      address,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedAddress.value = address;
                                      });
                                    },
                                  ),
                                );
                              }).toList();
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 220,
                                  child: Text(
                                    selectedAddress.value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 5,
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CTAButton(
                      onPressed: () async {
                        OrderFirebase newOrder = OrderFirebase(
                            userUID: user!.uid,
                            userName: user!.name,
                            userPhoneNumber: user!.phoneNumber,
                            address: selectedAddress.toString(),
                            cartProducts: _cart!.cartProducts,
                            orderTime: DateTime.now(),
                            changedTime: DateTime.now(),
                            paymentType: paymentText.toString(),
                            totalPrice: widget.totalPrice.toDouble(),
                            status: 'New Order');
                        await newOrder.create();
                        Get.dialog(OrderConfirmationPopup(
                            _cart!.cartProducts.length.toString(),
                            widget.totalPrice.toString(),
                            user!.name));
                      },
                      text: 'ORDER',
                      buttonWidth: ButtonWidth.fill,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

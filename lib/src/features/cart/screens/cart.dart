import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_models/product.dart';
import '../../../common_models/version.dart';
import '../../../common_widgets/cta_button.dart';
import '../../../common_widgets/adjust_quantity.dart';
import '../../../utilities/theme.dart';
import '../../shop/widgets/product_card.dart';
import '../controllers/cart_controller.dart';
import '../../authentication/controllers/auth_controller.dart';
import 'package:da22023/src/common_models/cart.dart';

class CartDrawer extends StatefulWidget {
  final CartController cartController;
  RxInt totalPrice = 0.obs;

  CartDrawer({required this.cartController});

  @override
  _CartDrawerState createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  final AuthController _authController = Get.find();
  double finalPrice = 0;
  CartFirebase? _cart;

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  Future<void> loadCart() async {
    final cartData =
        await CartFirebase.getCartByUserUID(_authController.uid.toString());
    setState(() {
      _cart = cartData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 560,
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
                'YOUR CART',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.black.withOpacity(0.8)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                ),
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
                          final product = await ProductFirebase.getProductById(
                              cartProduct.productUID);
                          Get.toNamed(
                            '/product_detail',
                            arguments: product,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(cartProduct.productImage),
                                Positioned(
                                  top: 2,
                                  right: 8,
                                  child: InkWell(
                                    onTap: () async {
                                      widget.cartController.removeFromCart(
                                        cartProduct.productUID,
                                        cartProduct.versionName,
                                      );

                                      await _cart!.update();
                                      widget.totalPrice.value = widget
                                          .cartController
                                          .calculateTotalPrice(
                                              _cart!.cartProducts)
                                          .toInt();
                                    },
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
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
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${cartProduct.price.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
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
                  CTAButton(
                    onPressed: () {
                      // You can access the list of products using _cart!.cartProducts
                    },
                    text: 'CHECK OUT',
                    buttonWidth: ButtonWidth.fill,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

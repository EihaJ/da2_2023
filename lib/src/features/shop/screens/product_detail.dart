import 'package:da22023/src/features/authentication/controllers/auth_controller.dart';
import 'package:da22023/src/features/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/cta_button.dart';
import '../../../common_widgets/footer.dart';
import '../../../common_widgets/appbar.dart';

import '../../../common_models/product.dart';
import '../../../common_models/policy.dart';
import '../../../common_models/cart.dart';
import '../../../common_models/cart_product.dart';

import '../../cart/screens/cart.dart';

import '../../homepage/widgets/productshowcase.dart';

import '../widgets/options_checkbox.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isExpanded = true;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  PolicyFirebase? policy1;
  PolicyFirebase? policy2;

  RxString versionName = ''.obs;
  RxDouble versionPrice = 0.0.obs;
  List<Rx<CartProduct>> _cartProduct = [];

  @override
  Widget build(BuildContext context) {
    final ProductFirebase product = Get.arguments as ProductFirebase;
    final ProductDetailController controller = Get.find();
    final CartController _cartController = Get.find();

    final AuthController _authController = Get.find();

    controller.init(product);

    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(),
        endDrawer: CartDrawer(cartController: _cartController),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product.image,
                          fit: BoxFit.contain,
                          width: 400,
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkResponse(
                                  highlightColor: Colors.black.withOpacity(0),
                                  hoverColor: Colors.black.withOpacity(0),
                                  enableFeedback: false,
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_back,
                                        size: 28,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Back',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${product.artist} : ${product.productName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ARTIST: ${product.artist}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'BRAND: ${product.brand}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 16),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                const SizedBox(height: 16),
                                OptionsCheckbox(
                                  product: product,
                                  versionName: versionName,
                                  versionPrice: versionPrice,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    CTAButton(
                                      onPressed: () {},
                                      text: 'BUY NOW',
                                    ),
                                    CTAButton(
                                      onPressed: () async {
                                        print(
                                            'versionName: $versionName, versionPrice: $versionPrice');
                                        final cartProduct = CartProduct(
                                          productUID: product.uid,
                                          productName: product.productName,
                                          productImage: product.image,
                                          versionName: versionName.value,
                                          price: versionPrice.value,
                                          stock: 0,
                                          amount: 1,
                                        );

                                        final cartId =
                                            _authController.uid.toString();
                                        final cart =
                                            await CartFirebase.getCartByUserUID(
                                                cartId);

                                        if (cart != null) {
                                          // If the cart exists, update the cart with the new product
                                          cart.cartProducts.add(cartProduct);
                                          await cart.update();
                                        } else {
                                          // If the cart doesn't exist, create a new cart and add the product
                                          final newCart = CartFirebase(
                                            uid: cartId,
                                            cartProducts: [cartProduct],
                                            changedTime:
                                                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}',
                                          );
                                          await newCart.create();
                                        }
                                        Get.back();
                                      },
                                      text: 'ADD TO CART',
                                      buttonType: ButtonType.secondary,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    InkResponse(
                      child: isExpanded == false
                          ? Row(
                              children: [
                                Text(
                                  'DESCRIPTION',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Icon(Icons.arrow_drop_down_outlined)
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'DESCRIPTION',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const Icon(Icons.arrow_drop_up_outlined)
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  product.description,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    InkResponse(
                      child: isExpanded2 == false
                          ? Row(
                              children: [
                                Text(
                                  'SHIPPING POLICY',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Icon(Icons.arrow_drop_down_outlined)
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'SHIPPING POLICY',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const Icon(Icons.arrow_drop_up_outlined)
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  policy1?.policyContent ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                      onTap: () {
                        setState(
                          () {
                            isExpanded2 = !isExpanded2;
                            if (isExpanded2 && policy1 == null) {
                              loadShippingPolicy(product.shippingPolicyID);
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    InkResponse(
                      child: isExpanded3 == false
                          ? Row(
                              children: [
                                Text(
                                  'RETURN POLICY',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Icon(Icons.arrow_drop_down_outlined)
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'RETURN POLICY',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const Icon(Icons.arrow_drop_up_outlined)
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  policy2?.policyContent ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                      onTap: () {
                        setState(() {
                          isExpanded3 = !isExpanded3;
                          if (isExpanded3 && policy2 == null) {
                            loadReturnPolicy(product.returnPolicyID);
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'OTHER PRODUCTS',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: Color.fromARGB(255, 33, 33, 33)),
              ),
              ProductShowcase(),
              WebsiteFooter(),
            ],
          ),
        ),
      ),
    );
  }

  void loadReturnPolicy(String policyId) {
    PolicyFirebase.getPolicyById(policyId).then((loadedPolicy) {
      setState(() {
        policy2 = loadedPolicy;
      });
    });
  }

  void loadShippingPolicy(String policyId) {
    PolicyFirebase.getPolicyById(policyId).then((loadedPolicy) {
      setState(() {
        policy1 = loadedPolicy;
      });
    });
  }
}

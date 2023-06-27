import 'package:da22023/src/features/shop/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/cta_button.dart';
import '../../../common_widgets/footer.dart';

import '../../../common_models/product.dart';

import '../../../features/search/screens/search.dart';

import '../../authentication/controllers/auth_controller.dart';
import '../../cart/controllers/cart_controller.dart';

import '../../cart/screens/cart.dart';

class ShopScreen extends StatefulWidget {
  ShopScreen();

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final AuthController _authController = Get.find();
  final CartController _cartController = Get.find();

  int _postCount = 6; // Initial number of product cards to display
  List<ProductFirebase> _products = []; // List of products from Firebase

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadProducts(); // Load products from Firebase
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        if (_postCount >= _products.length) {
          // No more items to load
          _postCount = _products.length;
        } else {
          _postCount += 6;
        }
      });
    }
  }

  void _loadProducts() {
    ProductFirebase.getAllProducts().listen((products) {
      setState(() {
        _products = products;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(),
      endDrawer: CartDrawer(
        cartController: _cartController,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkResponse(
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
                            width: 2,
                          ),
                          Text(
                            'Back',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkResponse(
                          onTap: () {
                            //Get Dialog Filter
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.filter_alt_outlined,
                                size: 28,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Filter',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        InkResponse(
                          onTap: () {
                            Get.dialog(SearchScreen());
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                size: 28,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Search',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Divider(color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisCount: 4,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: _postCount,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < _products.length) {
                        // Display the product card
                        return ProductCard(
                          product: _products[index],
                        );
                      } else {
                        return Container(
                          padding: const EdgeInsetsDirectional.only(bottom: 80),
                        ); // Placeholder for empty item
                      }
                    },
                  ),
                ),
              ),
              // WebsiteFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

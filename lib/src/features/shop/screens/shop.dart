import 'package:da22023/src/features/shop/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/cta_button.dart';
import '../../../common_widgets/footer.dart';

import '../../../features/search/screens/search.dart';

class ShopScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  ShopScreen(this.scaffoldKey);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _postCount = 6; // Initial number of product cards to display
  final List<ProductCard> _products = [
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description:
          'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    ProductCard(
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      link: '',
    ),
    ProductCard(
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      image:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      link: '',
    ),
    // Add more products here
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      endDrawer: Drawer(),
      appBar: appBar(
        scaffoldKey: widget.scaffoldKey,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkResponse(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.filter_alt_outlined,
                          size: 28,
                          color: Colors.black,
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
                      print('search');
                      Get.dialog(SearchScreen());
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 28,
                          color: Colors.black,
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        productName: _products[index].productName,
                        brand: _products[index].brand,
                        price: _products[index].price,
                        description: _products[index].description,
                        image: _products[index].image,
                        link: _products[index].link,
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
    );
  }
}

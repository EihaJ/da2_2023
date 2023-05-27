import '../../../common_models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../../shop/widgets/product_card.dart';

class CartDrawer extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final List<Product> _products = [
    Product(
      version: 'EPs',
      id: '1',
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      mainImage:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      artist: '',
      tags: [],
  
    ),
    Product(
      version: 'LPs',
      id: '2',
      productName: 'Product 2',
      brand: 'Brand B',
      price: 20.50,
      description: 'Product 2 description goes here.',
      mainImage:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
      artist: '',
      tags: [],
    
    ),
    Product(
      version: 'EPs',
      id: '1',
      productName: 'Product 1',
      brand: 'Brand A',
      price: 10.00,
      description: 'Product 1 description goes here.',
      mainImage:
          'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
      artist: '',
      tags: [],
       
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 560,
      child: Column(
        children: [
          ListTile(
            title: Text('Cart Drawer'),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 44,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(product.mainImage),
                      ListTile(
                        title: Text(product.productName),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement checkout logic here
              // You can access the list of products using _products list
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}

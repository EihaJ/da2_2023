import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;

   
    final String productName = arguments?['productName'] ?? '';
    final String brand = arguments?['brand'] ?? '';
    final double price = arguments?['price'] ?? 0.0;
    final String description = arguments?['description'] ?? '';
    final String image = arguments?['image'] ?? '';
    final String link = arguments?['link'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Text(
                'Brand: $brand',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              Text(
                '\$$price',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text('Buy Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

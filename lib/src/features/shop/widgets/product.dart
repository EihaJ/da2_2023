import 'package:da22023/src/common_widgets/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String brand;
  final double price;
  final String description;
  final String image;
  final String link;

  ProductCard({
    required this.productName,
    required this.brand,
    required this.price,
    required this.description,
    required this.image,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the tap event here
        Get.toNamed(
          '/product_detail',
          arguments: {
            'productName': productName,
            'brand': brand,
            'price': price,
            'description': description,
            'image': image,
            'link': link,
        
          },
        );
        print('Product tapped: $productName');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              Text(
                productName,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 16),
              //   Text(
              //     'Brand: $brand',
              //     style: Theme.of(context).textTheme.bodyLarge,
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 1,
              //   ),
              //  const  SizedBox(height: 2),

              const SizedBox(height: 2),
              Expanded(
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkResponse(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'View Product',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

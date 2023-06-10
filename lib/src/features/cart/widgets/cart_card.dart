import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/adjust_quantity.dart';
import '../../../common_models/product.dart';
import '../../../utilities/theme.dart';
import '../controllers/cart_controller.dart';

class CartCard extends StatelessWidget {
  final ProductFirebase product;

  const CartCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add your onTap logic here
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(product.image),
              Positioned(
                top: 2,
                right: 8,
                child: InkWell(
                  onTap: () {
                    // Remove Card
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('Price: \$${product.version.price.toStringAsFixed(2)}'),
                    // AdjustableQuantity(
                    //   onChanged: (int quantity) {
                    //     // Handle quantity change here
                    //   },
                    //   textSize: 14,
                    //   buttonSize: 24,
                    //   iconSize: 16,
                    //   distance: 12,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
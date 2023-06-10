import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common_models/product.dart';

class SearchTile extends StatelessWidget {
  ProductFirebase product;
  SearchTile(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            Get.toNamed('/product_detail', arguments: product);
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
          
                Image.network(
                    
                    product.image,
                    fit: BoxFit.fitHeight,
                    width: 64,
                    height: 64,
                  ),
           SizedBox(width:8 ,),
                Column(
                  children: [
                    Text(
                      '${product.artist} : ${product.productName}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Brand: ${product.brand}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
          )
    );
  }
}

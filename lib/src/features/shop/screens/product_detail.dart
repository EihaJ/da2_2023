import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/cta_button.dart';
import '../../../common_widgets/footer.dart';
import '../../../common_models/product.dart';

import '../../homepage/widgets/productshowcase.dart';

import '../widgets/options_checkbox.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;

    final Product? product = Product.fromJson(arguments?['product']);

    if (product == null) {
      return Center(
        child: Text('Product not found.'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      product.mainImage ?? 'fallback_image_url',
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
                            Text(
                              '${product.artist} : ${product.productName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
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
                            OptionsCheckbox(),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                CTAButton(
                                  onPressed: () {},
                                  text: 'BUY NOW',
                             
                                ),
                                CTAButton(
                                  onPressed: () {},
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
                const SizedBox(
                  height: 16,
                ),
                InkResponse(
                  child: isExpanded
                      ? Row(
                          children: [
                            Text(
                              'DESCRIPTION',
                              style: Theme.of(context).textTheme.headlineSmall,
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                            )
                          ],
                        ),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                InkResponse(
                  child: isExpanded2
                      ? Row(
                          children: [
                            Text(
                              'SHIPPING',
                              style: Theme.of(context).textTheme.headlineSmall,
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
                                  'SHIPPING',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Icon(Icons.arrow_drop_up_outlined)
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              //get content from default change into default content
                              product.description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                  onTap: () {
                    setState(() {
                      isExpanded2 = !isExpanded2;
                    });
                  },
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                InkResponse(
                  child: isExpanded3
                      ? Row(
                          children: [
                            Text(
                              'RETURN POLICY',
                              style: Theme.of(context).textTheme.headlineSmall,
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                            )
                          ],
                        ),
                  onTap: () {
                    setState(() {
                      isExpanded3 = !isExpanded3;
                    });
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'RECOMMENDED FOR YOU',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ProductShowcase(),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          WebsiteFooter(),
        ],
      ),
    );
  }
}

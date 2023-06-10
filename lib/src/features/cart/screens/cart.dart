// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../common_models/product.dart';
// import '../../../common_widgets/cta_button.dart';
// import '../../../common_widgets/adjust_quantity.dart';

// import '../../../utilities/theme.dart';

// import '../../shop/widgets/product_card.dart';

// import '../controllers/cart_controller.dart';

// class CartDrawer extends StatefulWidget {
//   @override
//   _CartDrawerState createState() => _CartDrawerState();
// }

// class _CartDrawerState extends State<CartDrawer> {
//   final CartController cartController = Get.find<CartController>();
//   double finalPrice = 0;
//   final List<ProductFirebase> _products = [
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: 560,
//       child: Column(
//         children: [
//           Container(
//             height: 64,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 4,
//                   offset:
//                       Offset(0, 2), // Adjust the offset as per your preference
//                 ),
//               ],
//               color: Colors.white, // Add a background color if needed
//             ),
//             child: Center(
//               child: Text(
//                 'YOUR CART',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge
//                     ?.copyWith(color: Colors.black.withOpacity(0.8)),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16.0),
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 0.8,
//                   crossAxisCount: 2,
//                 ),
//                 itemCount: _products.length,
//                 itemBuilder: (context, index) {
//                   final product = _products[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(
//                       right: 16,
//                       top: 8,
//                       bottom: 8,
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 12,
//                             offset: const Offset(0,
//                                 2), // Adjust the offset as per your preference
//                           ),
//                         ],
//                         color: Colors.white, // Add a background color if needed
//                       ),
//                       child: InkWell(
//                         onTap: () {
//                           // Add your onTap logic here
//                         },
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Stack(
//                               children: [
//                                 Image.network(product.image),
//                                 Positioned(
//                                   top: 2,
//                                   right: 8,
//                                   child: InkWell(
//                                     onTap: () {
//                                       // Remove Card
//                                     },
//                                     child: Container(
//                                       height: 32,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white,
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             blurRadius: 4,
//                                             offset: const Offset(0, 2),
//                                           ),
//                                         ],
//                                       ),
//                                       child: const Icon(
//                                         Icons.close,
//                                         color: Colors.black,
//                                         size: 20,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                                 vertical: 4,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     product.productName,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleLarge
//                                         ?.copyWith(color: Colors.black),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       // Text(
//                                       //   '\$${product.price.toStringAsFixed(2)}',
//                                       //   style: Theme.of(context)
//                                       //       .textTheme
//                                       //       .bodyLarge
//                                       //       ?.copyWith(
//                                       //         color: Theme.of(context)
//                                       //             .primaryColor,
//                                       //         fontWeight: FontWeight.bold,
//                                       //       ),
//                                       // ),
//                                       // AdjustableQuantity(
//                                       //   initialValue: product.quantity.toInt(),
//                                       //   onChanged: (quantity) =>
//                                       //       _onQuantityChanged(
//                                       //           product, quantity.toDouble()),
//                                       //   textSize: 14,
//                                       //   buttonSize: 24,
//                                       //   iconSize: 16,
//                                       //   distance: 12,
//                                       // ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 4,
//                   offset:
//                       Offset(0, -4), // Adjust the offset as per your preference
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 16.0,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('TOTAL: '),
//                       Text(
//                         '\$${finalPrice.toStringAsFixed(2)}',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   CTAButton(
//                     onPressed: () {
//                       // Implement checkout logic here
//                       // You can access the list of products using _products list
//                     },
//                     text: 'CHECK OUT',
//                     buttonWidth: ButtonWidth.fill,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onQuantityChanged(ProductFirebase product, double quantity) {
//     setState(() {
//       product.quantity = quantity;
//       calculateFinalPrice();
//     });
//   }

//   void calculateFinalPrice() {
//     finalPrice = 0.0;
//     for (final product in _products) {
//       finalPrice += product.price * product.quantity;
//     }
//   }
// }

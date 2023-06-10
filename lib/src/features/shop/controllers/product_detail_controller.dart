import 'package:get/get.dart';
import 'package:da22023/src/common_models/product.dart';

class ProductDetailController extends GetxController {
  late ProductFirebase product;

  // Use this method to initialize the product
  void init(ProductFirebase product) {
    this.product = product;
  }

  // Add any other controller logic or data manipulation here
}

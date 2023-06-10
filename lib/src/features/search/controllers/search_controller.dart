import 'package:get/get.dart';
import '../../../common_models/product.dart';

class SearchController extends GetxController {
  final searchText = ''.obs;
  final _productsStream = Rx<List<ProductFirebase>>([]);

  List<ProductFirebase> get products => _productsStream.value;

  List<ProductFirebase> get filteredProducts => products
      .where((product) =>
          product.productName.toLowerCase().contains(searchText.value.toLowerCase()) ||
          product.artist.toLowerCase().contains(searchText.value.toLowerCase())||
          product.brand.toLowerCase().contains(searchText.value.toLowerCase()))

      .toList();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    _productsStream.bindStream(ProductFirebase.getAllProducts());
  }

  void search(String query) {
    searchText.value = query;
  }
}

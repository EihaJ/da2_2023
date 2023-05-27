import 'package:get/get.dart';

class CartController extends GetxController {
  final RxBool isCartDrawerOpen = false.obs;

  void toggleCartDrawer() {
    isCartDrawerOpen.toggle();
  }
}
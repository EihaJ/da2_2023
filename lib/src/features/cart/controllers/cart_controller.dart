import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isCartDrawerOpen = false.obs;

  void toggleCartDrawer() {
    isCartDrawerOpen.toggle();
  }
}
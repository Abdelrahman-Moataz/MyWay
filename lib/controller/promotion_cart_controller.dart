import 'package:banda/NavBar.dart';
import 'package:banda/menu_stuff/promotion_stuff/promotion_model.dart';
import 'package:banda/widgets/const.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';






class PromotionCartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(PromotionModels productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(PromotionModels productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }
  }

  void removeOneProduct(PromotionModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);


  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: "Clear Products",
        titleStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        middleText: "Are you sure you need to Clear Products",
        middleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: "No",
        cancelTextColor: Colors.white,
        textConfirm: "yes",
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.to(const NavBarPage());
        },
        onConfirm: () {
          Get.back();
          productMap.clear();

        },
        buttonColor: AppColors.kMain);
  }

  get productsSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}

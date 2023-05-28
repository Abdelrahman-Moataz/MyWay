import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/const.dart';
import 'coffee_cart_controller.dart';
import 'coffee_controller.dart';
import 'coffee_model.dart';







class CoffeeCardItems extends StatelessWidget {
  CoffeeCardItems({Key? key}) : super(key: key);
  final controller = Get.find<CoffeeController>();
  final cartController = Get.find<CoffeeCartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? Colors.pinkAccent : AppColors.kMain,
            ));
      } else {
        return Expanded(
          child: GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                  image: controller.productList[index].image,
                  price: controller.productList[index].description,
                  rate: controller.productList[index].title,
                  productId: controller.productList[index].id,
                  productModels: controller.productList[index],
                );
              }),
        );
      }
    });
  }




  Widget buildCardItems({
    required String image,
    required String price,
    required String rate,
    required int productId,
    required CoffeeModels productModels,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ]),
        child: Column(
          children: [
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.manageFav(productId);
                      },
                      icon: controller.isFav(productId) ?
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ) :

                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                      )

                  ),
                  IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColors.kMain,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$rate",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }






}

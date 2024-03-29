import 'package:banda/controller/product_controller.dart';
import 'package:banda/reusable/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

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
                childAspectRatio: 0.9,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                    image: controller.productList[index].image,
                    price: controller.productList[index].price,
                    rate: controller.productList[index].rating.rate,
                    productId: controller.productList[index].id,
                );
              }),
        );
      }
    });
  }




  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
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
                    "\$ $price",
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

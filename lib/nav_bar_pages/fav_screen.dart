import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/product_controller.dart';
import '../../../menu_stuff/coffee_stuff/coffee_controller.dart';
import '../../../menu_stuff/promotion_stuff/promotion_controller.dart';


class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());
  final promotionController = Get.put(PromotionController());
  final coffeeController = Get.put(CoffeeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {

        if (controller.favList.isEmpty ) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.favorite_outline,
                    size: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please, Add your favorites products.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          );
        }


        else if(controller.favList.isNotEmpty){
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  image: controller.favList[index].image,
                  price: controller.favList[index].price,
                  title: controller.favList[index].title,
                  productId: controller.favList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favList.length);
        }



         if (coffeeController.favList.isEmpty ) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.favorite_outline,
                    size: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please, Add your favorites products.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          );
        }

        else if(coffeeController.favList.isNotEmpty){
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  image: controller.favList[index].image,
                  price: controller.favList[index].price,
                  title: controller.favList[index].title,
                  productId: controller.favList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favList.length);
        }


        if (promotionController.favList.isEmpty ) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.favorite_outline,
                    size: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please, Add your favorites products.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          );
        }


        else if(promotionController.favList.isNotEmpty){
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  image: controller.favList[index].image,
                  price: controller.favList[index].price,
                  title: controller.favList[index].title,
                  productId: controller.favList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favList.length);
        }




        else {
          return const Center(child: Text("Nothing to see"),);
        }





        // else {
        //   return ListView.separated(
        //       itemBuilder: (context, index) {
        //         return buildFavItems(
        //           image: controller.favList[index].image,
        //           price: controller.favList[index].price,
        //           title: controller.favList[index].title,
        //           productId: controller.favList[index].id,
        //         );
        //       },
        //       separatorBuilder: (context, index) {
        //         return const Divider(
        //           color: Colors.grey,
        //           thickness: 1,
        //         );
        //       },
        //       itemCount: controller.favList.length);
        // }




      }),
    );
  }





  Widget buildFavItems({
          required String image,
          required double price,
          required String title,
          required int productId,
        })
  {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFav(productId);
                  promotionController.manageFav(productId);
                  coffeeController.manageFav(productId);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }






}

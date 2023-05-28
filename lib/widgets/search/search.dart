import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../../controller/cart_controller.dart';
import '../../controller/product_controller.dart';
import '../../menu_stuff/cart_screen.dart';
import '../card_items.dart';
import '../const.dart';
import '../search_filed.dart';

class SearchProduct extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back_ios));
  }


  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
  return  Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.kMain,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  Text(
                  "Welcome",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),


                Obx(() {
                  return  badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 0, end: 3),
                    badgeAnimation: const badges.BadgeAnimation.slide(
                      // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                      // curve: Curves.easeInCubic,
                    ),
                    showBadge: true,
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.red,
                    ),
                    badgeContent:  Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Get.to( CartScreen());
                        }, icon: const Icon(Icons.shopping_cart)),
                  );
                }),






              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black54 : AppColors.kMain,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Find your",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "INSPIRATION",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SearchFromText(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(alignment: Alignment.topLeft,
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30,),

        CardItems(),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const Center(
      child: Text("Search user"),
    );
  }

}
import 'package:banda/nav_bar_pages/sub_pages/menue/beverages.dart';
import 'package:banda/nav_bar_pages/sub_pages/menue/dessert.dart';
import 'package:banda/nav_bar_pages/sub_pages/menue/food.dart';
import 'package:banda/nav_bar_pages/sub_pages/menue/promotions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../reusable/const.dart';
import '../reusable/menu_container.dart';
import '../reusable/search_filed.dart';

class MenuPage extends StatelessWidget {



  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.only(right: 320),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const Expanded(child: SizedBox()),

                Container(height: 500,
                  decoration: BoxDecoration(
                      color: kmain,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))
                  ),
                ),


                //const Expanded(child: SizedBox()),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //const Expanded(child: SizedBox()),

                MenuContainer(title: "Food",subTitle: "120 Items",nPic: food[0],tap: (){Get.to(const Food());},),
                const SizedBox(height: 20,),
                MenuContainer(title: "Beverages",subTitle: "220 Items",nPic: food[1],tap: (){Get.to(const Beverages());},),
                const SizedBox(height: 20,),
                MenuContainer(title: "Desserts",subTitle: "155 Items",nPic: food[2],tap: (){Get.to(const Desserts());},),
                const SizedBox(height: 20,),
                MenuContainer(title: "Promotions",subTitle: "35 Items",nPic: food[3],tap: (){Get.to(const Promotions());},),

                //const Expanded(child: SizedBox()),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Menu",style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart))
                  ],),
                //const SearchFiled(),
                const Text("Pick your favourite category",
                  style: TextStyle(fontSize: 22),
                )

              ],
            ),
          ),








        ],
      ),
    ));
  }
}


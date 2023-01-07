import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable/search_filed.dart';


class Beverages extends StatelessWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios_new)),
                    const Text(
                      "Beverages",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                    }, icon: const Icon(Icons.shopping_cart))
              ],
            ),

            const SizedBox(height: 15,),
            const SearchFiled(),
          ],
        ),
      ),
    ));
  }
}

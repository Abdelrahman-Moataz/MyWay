import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_product_card.dart';
import '../widgets/cart_tottal.dart';
import '../widgets/const.dart';
import '../widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController >();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //backgroundColor: context.theme.backgroundColor,
         appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: AppColors.kMain,
          centerTitle: true,
          actions: [
          IconButton(onPressed: () {
            controller.clearAllProducts();
          }, icon: const Icon(Icons.backspace))
        ],
      ),
            body: Obx((){

              if(controller.productMap.isEmpty){
                return const EmptyCart();
              }else{
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 700,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return  CartProductCard(
                              productModels: controller.productMap.keys.toList()[index],
                              index: index,
                              quantity: controller.productMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: controller.productMap.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: CardTotal(),
                      )
                    ],
                  ),
                );
              }


            })
    ));
  }
}

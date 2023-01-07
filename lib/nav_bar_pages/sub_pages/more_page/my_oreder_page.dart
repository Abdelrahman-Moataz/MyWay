import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reusable/const.dart';


class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 20,left: 10,right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios_new)),
                        const Text(
                          "My Order",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                        }, icon: const Icon(Icons.shopping_cart))
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Container(width: 120,height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(foodIcon[0]),fit: BoxFit.cover),
                        borderRadius: const BorderRadius.all(Radius.circular(30))
                      ),
                    ),
                    const SizedBox(width: 15,),

                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text(" King Burgers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Row(children: [
                        Icon(Icons.star,color: kmain,),
                        Text("4.9",style: TextStyle(color: kmain),),
                        const SizedBox(width: 5,), const Text("(124 rating) Cafe",style: TextStyle(color: Colors.grey,fontSize: 12),)
                      ],),
                        const Text(" Burger .Western Food",style: TextStyle(color: Colors.grey,fontSize: 12)),
                        Row(children: [
                          Icon(Icons.pin_drop,color: kmain,),
                          Text("4.9",style: TextStyle(color: kmain),),
                          const SizedBox(width: 5,), const Text("No. 03. 4th Lane, New york",style: TextStyle(color: Colors.grey,fontSize: 12),)
                        ],),
                        
                    ],)

                  ],),
                )



              ],
            ),
          ),
        ));
  }
}

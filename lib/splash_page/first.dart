import 'package:banda/reusable/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../reusable/bootom_reusable.dart';
import '../loginpages/login_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(shape,
              fit: BoxFit.fitHeight,
              color: Colors.white.withOpacity(0.9),
              colorBlendMode: BlendMode.modulate,),),

          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              BG,
              fit: BoxFit.fitHeight,
              color: Colors.white.withOpacity(0.10),
              colorBlendMode: BlendMode.modulate,
            ),
          ),



          Column(
            children: [
              //const SizedBox(height: 80,),
              const Expanded(flex:2, child: SizedBox()),

              Center(child: Image.asset(banda)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppNameA,style: const TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 22),),
                  Text(AppNameB,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                ],),
              const SizedBox(height: 10,),
              const Text("FOOD DELIVERY"),
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.only(left: 50,right: 50),
                child: Text("Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"),
              ),
              const SizedBox(height: 40,),

              BottonReuseable(filledColor: kmain,title: "Login",tap: (){
                Get.to(const  LoginPage());
              },),
              const SizedBox(height: 20,),

              BottonReuseable(title: "Create an Account",tap: (){},),


              const Expanded(child: SizedBox()),
            ],
          )


        ],
      ),
    ));
  }
}

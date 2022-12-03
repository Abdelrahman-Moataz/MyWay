import 'package:banda/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'first.dart';
import '../reusable/const.dart';

class SplahsPage extends StatelessWidget {
  const SplahsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: GestureDetector(

          onTap: (){
           Get.to(FirstPage(),transition: Transition.downToUp);
          },

          child: Stack(
          children: [
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
            Center(child: Image.asset(banda)),

            Column(
              children: [

                const Expanded(flex: 2,child: SizedBox()),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppNameA,style: const TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 22),),
                    Text(AppNameB,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                  ],),
                const SizedBox(height: 10,),
                const Text("FOOD DELIVERY"),
                const SizedBox(height: 15,),

                const Text("Let's Start", style: TextStyle(fontSize: 20),),

                const Expanded(child: SizedBox()),
              ],
            )

          ],
      ),
        ),
    ));
  }
}

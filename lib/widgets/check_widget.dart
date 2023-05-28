import 'package:banda/controller/auth_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBox extends StatelessWidget {
   CheckBox({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),

              ),
              child: controller.isCheckBox ? const Icon(Icons.check) : Container(),
            ),
          ),

          const SizedBox(width: 10,),
          Row(
            children: const [
              Text("I Accept ",style: TextStyle(fontSize: 16,color: Colors.black),),
              Text("Terms & Conditions",style: TextStyle(fontSize: 16,color: Colors.black,decoration: TextDecoration.underline),),
            ],
          )



        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../reusable/bootom_reusable.dart';
import '../reusable/const.dart';
import '../reusable/logform.dart';
import 'login_page.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Flexible(
                  child: Column(
                    children:  [
                      const SizedBox(height: 40,),

                      const Center(
                          child: Text(
                            "We have sent an OTP to your Mobile",
                            style: TextStyle(fontSize: 25),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Please check your mobile number 071*****12 continue to reset your password"),
                      const SizedBox(height: 20,),
                      LogForm(title: "OTP code",),
                      const SizedBox(height: 20,),

                      BottonReuseable(tap: (){
                        Get.to(const LoginPage());
                      },title: "Next",filledColor: kmain,),

                      const SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Didn't Receive"),
                          TextButton(onPressed: (){
                            Get.reloadAll();
                          }, child: Text("Click Here",style: TextStyle(color: kmain),))
                        ],)

                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}

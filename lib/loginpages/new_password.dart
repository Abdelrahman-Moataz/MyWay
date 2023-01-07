import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../reusable/bootom_reusable.dart';
import '../reusable/const.dart';
import '../reusable/logform.dart';
import 'login_page.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

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
                            "New Password",
                            style: TextStyle(fontSize: 25),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Please enter your email to receive a link to  create a new password via email"),
                      const SizedBox(height: 20,),
                      LogForm(title: "New Password",),
                      const SizedBox(height: 20,),
                      LogForm(title: "Confirm Password",),
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

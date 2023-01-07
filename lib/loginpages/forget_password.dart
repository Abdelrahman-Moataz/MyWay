import 'package:banda/loginpages/login_page.dart';
import 'package:banda/loginpages/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../reusable/bootom_reusable.dart';
import '../reusable/const.dart';
import '../reusable/logform.dart';


class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

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
                            "Reset Password",
                            style: TextStyle(fontSize: 25),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Please enter your email to receive a link to  create a new password via email"),
                      const SizedBox(height: 20,),
                      LogForm(title: "Email",),
                      const SizedBox(height: 20,),

                      BottonReuseable(tap: (){
                        Get.to(const OTPPage());
                      },title: "Send",filledColor: kmain,),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}

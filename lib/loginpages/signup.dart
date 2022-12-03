import 'package:banda/NavBar.dart';
import 'package:banda/loginpages/login_page.dart';
import 'package:banda/reusable/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../reusable/bootom_reusable.dart';
import '../reusable/logform.dart';


class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

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
                            "Login",
                            style: TextStyle(fontSize: 25),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Add your details to Signup"),
                      const SizedBox(height: 20,),

                      LogForm(title: "Name",),
                      const SizedBox(height: 20,),

                      LogForm(title: "Email",),
                      const SizedBox(height: 20,),

                      LogForm(title: "Mobile No",),
                      const SizedBox(height: 20,),

                      LogForm(title: "Address",),
                      const SizedBox(height: 20,),

                      LogForm(title: "Password",),
                      const SizedBox(height: 20,),

                      LogForm(title: "Confirm Password",),
                      const SizedBox(height: 20,),

                      BottonReuseable(tap: (){
                        Get.to(const NavBarPage());
                      },title: "Sign Up",filledColor: kmain,),
                      const SizedBox(height: 20,),


                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an Account?"),
                          TextButton(onPressed: (){
                            Get.to(const LoginPage());
                          }, child: Text("Login",style: TextStyle(color: kmain),))
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


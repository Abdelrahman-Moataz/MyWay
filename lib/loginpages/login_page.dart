import 'package:banda/NavBar.dart';
import 'package:banda/loginpages/signup.dart';
import 'package:banda/reusable/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../reusable/bootom_reusable.dart';
import '../reusable/logform.dart';
import '../reusable/socialmedia_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  const Text("Add your details to login"),
                  const SizedBox(height: 20,),
                  LogForm(title: "Your Email",),
                  const SizedBox(height: 20,),

                  LogForm(title: "Password",),
                  const SizedBox(height: 20,),
                  BottonReuseable(tap: (){
                    Get.to(const NavBarPage());
                  },title: "Login",filledColor: kmain,),
                  const SizedBox(height: 20,),
                  TextButton(onPressed: (){}, child: const Text("Forget your password",style: TextStyle(color: Colors.grey),)),
                  const SizedBox(height: 30,),
                  const Text("or Login with"),
                  const SizedBox(height: 20,),
                  SocialMedia(tap: (){},filledColor: Colors.blue,ficone: FontAwesomeIcons.facebook,title: "Login with facebook",),
                  const SizedBox(height: 20,),
                  SocialMedia(tap: (){},filledColor: Colors.red,ficone: FontAwesomeIcons.googlePlus,title: "Login with Google",),
                  const SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Get.to(const SignupPage());
                    }, child: Text("Sign Up",style: TextStyle(color: kmain),))
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


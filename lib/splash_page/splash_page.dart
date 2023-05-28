import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../NavBar.dart';
import '../controller/auth_controler.dart';
import '../loginpages/login_page.dart';
import '../widgets/const.dart';
import 'package:geolocator/geolocator.dart';

class SplahsPage extends StatefulWidget {
  const SplahsPage({Key? key}) : super(key: key);

  @override
  State<SplahsPage> createState() => _SplahsPageState();
}

class _SplahsPageState extends State<SplahsPage> {

  final controller = Get.find<AuthController>();

  void getCurrentLocation ()async{
    Geolocator.requestPermission();
  }



  @override
  void initState() {

    super.initState();

    getCurrentLocation();


      //FirebaseAuth.instance.currentUser != null  ?  Get.to(()=>const NavBarPage())  : Get.to(()=>LoginPage());



    //Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  LoginPage())));

    Timer(const Duration(seconds: 3), () => FirebaseAuth.instance.currentUser !=null ?
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  LoginPage())) :
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const NavBarPage()))

    );

    // Future.delayed(const Duration(seconds: 2), ()async{
    //
    //    FirebaseAuth.instance.currentUser != null || GetStorage().read<bool>('auth') == true ? LoginPage() : const NavBarPage();
    // }
    // );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppStrings.bg,
              fit: BoxFit.fitHeight,
              color: Colors.white.withOpacity(0.10),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Center(child: Image.asset(AppStrings.panda)),

          Column(
            children: [

              const Expanded(flex: 2,child: SizedBox()),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Text(AppStrings.appNameA,style:  TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 22),),
                  Text(AppStrings.appNameB,style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                ],),
              const SizedBox(height: 10,),
              const Text("FOOD DELIVERY"),
              const SizedBox(height: 15,),

              const Text("Let's Start", style: TextStyle(fontSize: 20),),
              const SizedBox(height: 15,),
              const CircularProgressIndicator(),

              const Expanded(child: SizedBox()),
            ],
          )

        ],
      ),
    ));
  }
}

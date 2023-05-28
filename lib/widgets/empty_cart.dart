import 'package:banda/NavBar.dart';
import 'package:banda/reusable/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 150,
            color: Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
                text: "your cart is ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "Empty",
                style: TextStyle(
                    color: AppColors.kMain,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ])),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Add items to get Started",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 50,),

          SizedBox( height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: AppColors.kMain,
                  elevation: 0,
                ),
                  onPressed: () {
                    Get.to(const NavBarPage());
                  },
                  child: const Text("Go to Home",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  )))
        ],
      ),
    );
  }
}

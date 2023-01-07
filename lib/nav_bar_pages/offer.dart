import 'package:banda/reusable/const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../reusable/more_container.dart';
import '../try/mainpage.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Latest Offers",style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart))
                  ],),

                const SizedBox(height: 10,),

                const Text("Find discounts, Offers special meals and more!"),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed: (){},style:ButtonStyle(backgroundColor: MaterialStateProperty.all(kmain),
                    minimumSize: MaterialStateProperty.all(const Size(200, 30)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                        )
                    )
                ) , child: const Text("Check Offers"),),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          const Expanded(child: MainPage()),
        ],
      ),
    ));
  }
}



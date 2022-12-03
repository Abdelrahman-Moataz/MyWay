import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../reusable/more_container.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("More",style: TextStyle(fontSize: 20),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart))
              ],),

            const SizedBox(height: 20,),

             MoreContainer(title: "Payment Details",iconed: FontAwesomeIcons.moneyBillTransfer,),
            const SizedBox(height: 20,),

            MoreContainer(title: "Payment Details",iconed: FontAwesomeIcons.bagShopping,),
            const SizedBox(height: 20,),

            MoreContainer(title: "Payment Details",iconed: FontAwesomeIcons.solidBell,),
            const SizedBox(height: 20,),

            MoreContainer(title: "Payment Details",iconed: FontAwesomeIcons.solidEnvelope,),
            const SizedBox(height: 20,),

            MoreContainer(title: "Payment Details",iconed: FontAwesomeIcons.info,),
            const SizedBox(height: 20,),


          ],
        ),
      ),
    ));
  }
}



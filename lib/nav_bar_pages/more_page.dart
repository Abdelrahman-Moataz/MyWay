import 'package:banda/nav_bar_pages/sub_pages/more_page/about_us.dart';
import 'package:banda/nav_bar_pages/sub_pages/more_page/index_page.dart';
import 'package:banda/nav_bar_pages/sub_pages/more_page/my_oreder_page.dart';
import 'package:banda/nav_bar_pages/sub_pages/more_page/notifications_page.dart';
import 'package:banda/nav_bar_pages/sub_pages/more_page/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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

             MoreContainer(title: "Payment Details",iconed: FontAwesomeIcons.moneyBillTransfer,tap: (){Get.to(const PaymentPage());},),
            const SizedBox(height: 20,),

            MoreContainer(title: "My Orders",iconed: FontAwesomeIcons.bagShopping,tap:(){Get.to(const MyOrderPage());}),
            const SizedBox(height: 20,),

            MoreContainer(title: "Notifications",iconed: FontAwesomeIcons.solidBell,tap: (){Get.to(const NotificationsPage());},),
            const SizedBox(height: 20,),

            MoreContainer(title: "Inbox",iconed: FontAwesomeIcons.solidEnvelope,tap: (){Get.to(const IndexPage());},),
            const SizedBox(height: 20,),

            MoreContainer(title: "About Us",iconed: FontAwesomeIcons.info,tap: (){Get.to(const AboutUsPage());},),
            const SizedBox(height: 20,),


          ],
        ),
      ),
    ));
  }
}



import 'package:banda/reusable/search_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../reusable/bootom_reusable.dart';
import '../../../reusable/const.dart';
import '../../../reusable/container_filed.dart';
import '../../../reusable/show_sheet.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    const Text(
                      "Payment Details",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Customize your payment method",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 20.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Card(
                  child: Flexible(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text("Cash/Card on delivery"),
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("VISA"),
                            const Text("**** **** 2187"),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.red),
                                minimumSize: Size.zero, // Set this
                                padding: const EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ), // and this
                              ),
                              child: const Text(
                                'Delete Card',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text("Other Methods")),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30,),

            BottonReuseable(filledColor: kmain,tap: (){

              showModalBottomSheet<void>(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return ShowSheet(formKey: _formKey);
                },
              );


            },title: "Add Another Credit/Debit Card",)

          ],
        ),
      ),
    ));
  }
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bootom_reusable.dart';
import 'cardfield.dart';
import 'const.dart';



class ShowSheet extends StatelessWidget {
  const ShowSheet({
    Key? key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(height: 600,
          decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
          child: Center(
            child: ListView(

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Add Credit/Debit Card"),
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.close))
                    ],
                  ),
                ),
                const Divider(),


                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 8,bottom: 8),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return value;
                          },
                          decoration: const InputDecoration(
                            hintText: "Card Number",
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const CardField(),



                BottonReuseable(filledColor: AppColors.kMain,tap: (){},title: "Add Card",),


              ],
            ),
          ),
        ),
      ),
    );
  }
}



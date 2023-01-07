import 'package:flutter/material.dart';

import 'bootom_reusable.dart';
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
        child: Container(height: 400,
          decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Add Credit/Debit Card"),
                    Icon(Icons.close)
                  ],
                ),
                const Divider(),


                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),

                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                BottonReuseable(filledColor: kmain,tap: (){},title: "Add Card",),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


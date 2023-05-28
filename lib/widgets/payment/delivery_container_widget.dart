import 'package:flutter/material.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {


  int radioContainerIndex = 1;
  bool changeColors = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        buildRadioContainer(
        address: "Egypt",
        name: "abdo",
        phone: "010",
        title: "App",
        value: 1,
        color: changeColors ? Colors.white : Colors.grey.shade300,
        onChanged: (int? value){
          setState(() {
            radioContainerIndex = value!;
          });
          changeColors =! changeColors;
        }
      ),

        const SizedBox(height: 10,),

        buildRadioContainer(
            address: "Egypt",
            name: "Ahmed",
            phone: "012",
            title: "App ne ",
            value: 2,
            color: changeColors ? Colors.grey.shade300 : Colors.white,
            onChanged: (int? value){
              setState(() {
                radioContainerIndex = value!;
              });
              changeColors =! changeColors;
            }
        ),



      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,



  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value){
              onChanged(value);
            },
          ),
          const SizedBox(width: 10,),

          const Padding(padding: EdgeInsets.only(top: 10),),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              ),
              const SizedBox(height: 5,),

              Text(
                name,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              const SizedBox(height: 5,),

              Text(
                phone,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),

              const SizedBox(height: 5,),

              Text(
                address,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),

            ],
          )

        ],
      ),
    );
  }
}

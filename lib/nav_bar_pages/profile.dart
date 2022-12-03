import 'package:flutter/material.dart';

import '../reusable/bootom_reusable.dart';
import '../reusable/const.dart';
import '../reusable/container_filed.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          children: [

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Profile",style: TextStyle(fontSize: 20),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart))
              ],
            ),

            const SizedBox(height: 10,),
            const Center(child: CircleAvatar(foregroundImage: AssetImage("assets/PP.png"),maxRadius: 40,),),
            const SizedBox(height: 10,),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: const [
              Icon(Icons.edit, color: Colors.blue,),
              Text("   Edit profile",style: TextStyle(color: Colors.blue),)
            ],),
            const SizedBox(height: 10,),

            Center(child: Text("Hi there $name"),),

            const SizedBox(height: 8,),

            TextButton(onPressed: (){}, child: const Text("sign out",style: TextStyle(color: Colors.grey),)),
            const SizedBox(height: 15,),

            FiledContainer(title: "Name",body: name,),
            const SizedBox(height: 15,),
            FiledContainer(title: "Email",body: "Escap.abdo@gmail.com",),
            const SizedBox(height: 15,),
            FiledContainer(title: "Mobile no.",body: "01016702827",),
            const SizedBox(height: 15,),
            FiledContainer(title: "Address",body: "No 23, 6th lane, Colombia 03",),
            const SizedBox(height: 15,),

             BottonReuseable(filledColor: kmain,tap: (){},title: "Save",)



          ],
        ),
    );

  }
}


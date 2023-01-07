import 'package:flutter/material.dart';
import '../reusable/const.dart';
import '../reusable/search_filed.dart';
import '../reusable/top_icon.dart';
import '../try/mainpage.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Good morning $name",style: const TextStyle(fontSize: 20),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),
              ],),
            const SearchFiled(),

            const SizedBox(height: 10,),

            SizedBox(height: 100,
              child: ListView(shrinkWrap: true,scrollDirection: Axis.horizontal,
                children:  [
                  TopIcons(title: "Offers",iconPic: foodIcon[0],),
                   const SizedBox(width: 10,),
                  TopIcons(title: "Sushi",iconPic: foodIcon[1],),
                  const SizedBox(width: 10,),
                  TopIcons(title: "Pizza",iconPic: foodIcon[2],),
                  const SizedBox(width: 10,),
                  TopIcons(title: "Indian Food",iconPic: foodIcon[3],),
                  const SizedBox(width: 10,),
                  TopIcons(title: "Coffee",iconPic: foodIcon[4],),
                  const SizedBox(width: 10,),

                       ]),),

                    const SizedBox(height: 10,),

                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const Text("Popular Restaurants",style: TextStyle(fontSize: 20),),
                     TextButton(onPressed: (){}, child:  Text("View all",style: TextStyle(color: kmain),))
                    ],
                  ),


                  const SizedBox(height: 20,),


                  const Expanded(child: MainPage()),





            ],
        ),
      ),
    ));
  }
}



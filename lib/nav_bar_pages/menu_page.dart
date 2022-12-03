import 'package:flutter/material.dart';

import '../reusable/search_filed.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Menu",style: TextStyle(fontSize: 20),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart))
              ],),

            const SearchFiled()

          ],
        ),
      ),
    ));
  }
}


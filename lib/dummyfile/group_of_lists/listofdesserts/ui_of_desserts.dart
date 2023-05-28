
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/const.dart';
import 'overviewdesserts.dart';





class UIOfDesserts extends StatelessWidget {
  const UIOfDesserts(
      {super.key, required this.imageURL,
      required this.title,
      required this.id,
      required this.description,
      required this.rating,
      required this.phoneNum});

  final String id;
  final String title;
  final String imageURL;
  final double rating;
  final String description;
  final String phoneNum;





  _makingPhoneCall() async {
    var url = Uri.parse("tel:$phoneNum");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx) => OpenPageOfDesserts(
                    title: title,
                    imageURL: imageURL,
                    rating: rating,
                    description: description,
                   phoneNum: phoneNum,
                  )),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageURL), fit: BoxFit.fill),
            ),
          ),

          Align(alignment: Alignment.bottomCenter,
            child: Container(height: 80,width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.withAlpha(150)),
              child: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: const TextStyle(color: Colors.white, fontSize: 20),),
                        MaterialButton(
                        onPressed: _makingPhoneCall,

                            child: const Icon(Icons.call)
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.kMain,
                        ),
                        Text(
                          rating.toString(),
                          style: TextStyle(color: AppColors.kMain),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "(124 rating) Cafe . Western Food",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}




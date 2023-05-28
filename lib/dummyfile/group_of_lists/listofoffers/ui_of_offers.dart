import 'package:banda/widgets/const.dart';
import 'package:flutter/material.dart';
import 'offers_overview.dart';

class UiOfOffersPage extends StatelessWidget {
  const UiOfOffersPage(
      {super.key, required this.imageURL,
      required this.title,
      required this.id,
      required this.rating,
      required this.phoneNum});

  final String id;
  final String title;
  final String imageURL;
  final double rating;
  final int phoneNum;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx) => OpenPageOfOffers(
                    title: title,
                    imageURL: imageURL,
                    rating: rating,
                  )),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageURL), fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
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
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//   ClipRRect(
//   borderRadius: BorderRadius.circular(10),
//   child: GridTile(
//
//     child: GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//               builder: (ctx) => OpenPageOfRes(
//                 title: title,
//                 imageURL: imageURL, rating: rating,
//               )),
//         );
//       },
//       child: Image.network(
//         imageURL,
//         fit: BoxFit.cover,
//       ),
//     ),
//
//   ),
// );

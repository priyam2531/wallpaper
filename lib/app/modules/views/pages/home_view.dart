import 'package:flutter/material.dart';
import 'package:wallpaper/constant/app_image.dart';

import 'image_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List images = [
    AppImage.w1,
    AppImage.w2,
    AppImage.w3,
    AppImage.w4,
    AppImage.w5,
    AppImage.w6,
    AppImage.w7,
    AppImage.w8,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "Wallpaper",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          )),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(image: images[index]),));
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 100,width: 80,child: Image(image: AssetImage(images[index]),fit: BoxFit.cover),),
            ),
          );
        },
      ),
    );
  }

}

// class FullScreenImage extends StatelessWidget {
//   final String image;
//
//   FullScreenImage({required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(image),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

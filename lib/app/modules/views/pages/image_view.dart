import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:wallpaper/app/modules/controllers/home_controller.dart';
import 'package:wallpaper/app/modules/views/pages/home_view.dart';
import 'package:wallpaper/constant/app_color.dart';
import 'package:wallpaper/constant/app_icon.dart';
import 'package:wallpaper/constant/app_text_style.dart';

import '../../../../constant/export.dart';

class ImageView extends StatelessWidget {
  final String image;
  int _currentIndex = 0;
  HomeController homeController = Get.put(HomeController());
  HomeView homeview = HomeView();
  ImageView({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIcon.backarrow,
        elevation: 10,
        backgroundColor: AppColor.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            _showShareDialog(context);
          } else {
            _currentIndex = index;
          }
        },
        selectedItemColor: Colors.black, // <--- Add this line
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _showShareDialog(BuildContext context) {
    RxString _selectedOption = ''.obs; // Add this line to store the selected option

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Text('Apply',
              style: poppinsBold.copyWith(color: AppColor.blackTextColor, fontSize: 20)),
          content: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  title: Text('Set Home Screen'),
                  value: 'Set Home Screen',
                  groupValue: _selectedOption.value,
                  onChanged: (value) async {
                    _selectedOption.value = value as String;
                    if (value == 'Set Home Screen') {
                      await WallpaperManager.setWallpaperFromFile(image, WallpaperManager.HOME_SCREEN);
                    }
                  },
                ),
                RadioListTile(
                  title: Text('Set Lock Screen'),
                  value: 'Set Lock Screen',
                  groupValue: _selectedOption.value,
                  onChanged: (value) async {
                    _selectedOption.value = value as String;
                    if (value == 'Set Lock Screen') {
                      await WallpaperManager.setWallpaperFromFile(image, WallpaperManager.LOCK_SCREEN);
                    }
                  },
                ),
                RadioListTile(
                  title: Text('Set Both'),
                  value: 'Set Both',
                  groupValue: _selectedOption.value,
                  onChanged: (value) async {
                    _selectedOption.value = value as String;
                    if (value == 'Set Both') {
                      await WallpaperManager.setWallpaperFromFile(image, WallpaperManager.HOME_SCREEN);
                      await WallpaperManager.setWallpaperFromFile(image, WallpaperManager.LOCK_SCREEN);
                    }
                  },
                ),
                RadioListTile(
                  title: Text('Set With'),
                  value: 'Set With',
                  groupValue: _selectedOption.value,
                  onChanged: (value) {
                    _selectedOption.value = value as String;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                print('Selected option: $_selectedOption');
              },
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () async {
                if (_selectedOption.value == 'Set Home Screen') {
                  await WallpaperManager.setWallpaperFromFile(image,WallpaperManager.HOME_SCREEN);
                } else if (_selectedOption.value == 'Set Lock Screen') {
                  await WallpaperManager.setWallpaperFromFile(image, WallpaperManager.LOCK_SCREEN);
                } else if (_selectedOption.value == 'Set Both') {
                  await WallpaperManager.setWallpaperFromFile(image, WallpaperManager.HOME_SCREEN);
                  await WallpaperManager.setWallpaperFromFile(image, WallpaperManager.LOCK_SCREEN);
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}




//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
// import 'package:get/get.dart';
// import 'package:wallpaper/app/modules/controllers/home_controller.dart';
// import 'package:wallpaper/app/modules/views/pages/home_view.dart';
// import 'package:wallpaper/constant/app_color.dart';
// import 'package:wallpaper/constant/app_icon.dart';
// import 'package:wallpaper/constant/app_text_style.dart';
//
// import '../../../../constant/export.dart';
//
// class ImageView extends StatelessWidget {
//   final String image;
//   int _currentIndex = 0;
//   HomeController homeController = Get.put(HomeController());
//   RxString _selectedOption = ''.obs;
//
//   ImageView({required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//             onTap: () {
//               Get.to(HomeView());
//             },
//             child: AppIcon.backarrow),
//         elevation: 10,
//         backgroundColor: AppColor.transparent,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           if (index == 0) {
//             _showShareDialog(context);
//           } else {
//             _currentIndex = index;
//           }
//         },
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.share),
//             label: 'Share',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info_outline),
//             label: 'Info',
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(image),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Center(
//             child: ElevatedButton(
//               onPressed: () => _setWallpaper(context),
//               child: Text('Set as Wallpaper'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showShareDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           title: Text(
//             'Apply',
//             style: poppinsBold.copyWith(
//                 color: AppColor.blackTextColor, fontSize: 20),
//           ),
//           content: Obx(
//                 () => Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 RadioListTile(
//                   title: const Text('Set Home Screen'),
//                   value: 'Set Home Screen',
//                   groupValue: _selectedOption.value,
//                   onChanged: (value) {
//                     _selectedOption.value = value as String;
//                   },
//                 ),
//                 RadioListTile(
//                   title: const Text('Set Lock Screen'),
//                   value: 'Set Lock Screen',
//                   groupValue: _selectedOption.value,
//                   onChanged: (value) {
//                     _selectedOption.value = value as String;
//                   },
//                 ),
//                 RadioListTile(
//                   title: const Text('Set Both'),
//                   value: 'Set Both',
//                   groupValue: _selectedOption.value,
//                   onChanged: (value) {
//                     _selectedOption.value = value as String;
//                   },
//                 ),
//                 RadioListTile(
//                   title: const Text('Set With'),
//                   value: 'Set With',
//                   groupValue: _selectedOption.value,
//                   onChanged: (value) {
//                     _selectedOption.value = value as String;
//                   },
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             TextButton(
//               child: Text('Ok'),
//               onPressed: () {
//                 _applyWallpaper(context);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<void> _setWallpaper(BuildContext context) async {
//     try {
//       File file =File(image);
//       // var file = await DefaultCacheManager().getSingleFile(image);
//
//       int location = WallpaperManager.BOTH_SCREEN;
//
//       if (_selectedOption.value == 'Set Home Screen') {
//         location = WallpaperManager.HOME_SCREEN;
//       } else if (_selectedOption.value == 'Set Lock Screen') {
//         location = WallpaperManager.LOCK_SCREEN;
//       } else if (_selectedOption.value == 'Set Both') {
//         location = WallpaperManager.BOTH_SCREEN;
//       } else if (_selectedOption.value == 'Set With') {
//         // location = WallpaperManager.SET_WALLPAPER_WITHOUT_CHANGING;
//       }
//
//       final bool result = await WallpaperManager.setWallpaperFromFile(
//         file.path,
//         location,
//         // cropRect: Rect.fromLTWH(0, 0, 0, 0), // Adjust crop as needed
//       );
//
//       if (result) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Wallpaper set successfully!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to set wallpaper.')),
//         );
//       }
//     } on PlatformException catch (e) {
//       print('Failed to set wallpaper: $e');
//     }
//   }
//
//   void _applyWallpaper(BuildContext context) {
//     // Additional logic if needed before applying wallpaper
//   }
// }

import 'package:get/get.dart';
import 'package:wallpaper/app/modules/controllers/home_controller.dart';
import 'package:wallpaper/constant/app_color.dart';
import 'package:wallpaper/constant/app_icon.dart';
import 'package:wallpaper/constant/app_text_style.dart';

import '../../../../constant/export.dart';

class ImageView extends StatelessWidget {
  final String image;
  int _currentIndex = 0;
  HomeController homeController = Get.put(HomeController());
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
                  onChanged: (value) {
                    _selectedOption.value = value as String;
                  },
                ),
                RadioListTile(
                  title: Text('Set Lock Screen'),
                  value: 'Set Lock Screen',
                  groupValue: _selectedOption.value,
                  onChanged: (value) {
                    _selectedOption.value = value as String;
                  },
                ),
                RadioListTile(
                  title: Text('Set Both'),
                  value: 'Set Both',
                  groupValue: _selectedOption.value,
                  onChanged: (value) {
                    _selectedOption.value = value as String;
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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

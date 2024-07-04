import 'package:get/get.dart';
import 'package:wallpaper/constant/app_color.dart';
import 'package:wallpaper/constant/app_icon.dart';

import '../../../../constant/export.dart';

class ImageView extends StatelessWidget {
  final String image;
  int _currentIndex = 0;
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
          if(index==0) {
            _showShareDialog(context);
          }else{
            _currentIndex= index;
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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Share Image'),
          content: Text('Share this image with others'),
          actions: [
            TextButton(
              child: Text('Share'),
              onPressed: () {

              },
            ),
            TextButton(
              child: Text('Cancel'),
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

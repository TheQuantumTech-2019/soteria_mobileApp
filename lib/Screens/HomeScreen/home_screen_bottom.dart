import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:soperia_user/Screens/Profile/edit_profile.dart';
import 'package:soperia_user/Screens/Profile/profile_screen.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

import 'home_screen.dart';

class HomePageBottomNav extends StatefulWidget {
  @override
  _HomePageBottomNavState createState() => _HomePageBottomNavState();
}

class _HomePageBottomNavState extends State<HomePageBottomNav> {
  int bottomBarCurrentIndex = 0;
  int sliderCurrentIndex = 0;

  List<Widget> screens = [
    HomePage(),
    HomePage(),
    ProfileScreeen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: deepBlue,
        currentIndex: bottomBarCurrentIndex.clamp(0, 2), // Clamp _currentIndex between 0 and 2
        onTap: (int index) {
          setState(() {
            screens[index];
            bottomBarCurrentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(AssetImage(buttomhome)),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(
              AssetImage(buttom_list),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(AssetImage(buttom_profile)),
            /*  activeIcon: Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),))*/
          ),
        ],
      ),
      body: screens[bottomBarCurrentIndex],
    );
  }
}

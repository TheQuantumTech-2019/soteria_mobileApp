import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:soperia_user/Screens/HomeScreen/HomeScreenMenu/HomeInsurance/home_insurance.dart';
import 'package:soperia_user/Screens/HomeScreen/HomeScreenMenu/HomeInsurance/home_insurance_plan.dart';
import 'package:soperia_user/Screens/HomeScreen/HomeScreenMenu/HomeInsurance/office_insurance.dart';
import 'package:soperia_user/Screens/Profile/edit_profile.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomBarCurrentIndex = 0;
  int sliderCurrentIndex = 0;

  List<String> imageUrls = [
    slider,
    slider,
    slider,
    slider,
  ];
  List<String> texts = [
    individualMedical,
    life,
    home,
    personalAccident,
    travel,
    marine,
    automotive,
    office,
    critical,
    pet,
    pet,
    pet,
  ];
  
  List homescreenmenu=[
    HomeInsurance(),
    HomeInsurance(),
    HomeInsurance(),
    HomeInsurance(),
    HomeInsurance(),
    HomeInsurance(),
    HomeInsurance(),
    HomeInsurance(),
    HomeInsurance(),
    OfficeInsurance(),
    HomeInsurancePlanScreen(),
    HomeInsurance(),
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(splashImg))),
                ),
                SizedBox(width: 10),
                Text("Welcome, Mansi!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Spacer(),
                Icon(Icons.notifications_none_outlined),
                SizedBox(width: 10),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(translate))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200, // Set a fixed height for the CarouselSlider
            child: CarouselSlider.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    sliderCurrentIndex = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imageUrls.length,
                  (index) => Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: sliderCurrentIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(
                  text: "Buy Insurance Policy",
                  fontWeight: FontWeight.bold,
                  size: 12,
                ),
              ),
            ],
          ),

          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(10, (index) {
              return InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => homescreenmenu[index],)),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.yellow, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    AppText(text: '${texts[index]}', fontWeight: FontWeight.bold, size: 10),
                    AppText(text: insurance, fontWeight: FontWeight.bold, size: 10)
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

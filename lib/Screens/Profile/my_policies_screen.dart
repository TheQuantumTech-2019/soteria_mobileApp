import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class MyPolicies extends StatefulWidget {
  const MyPolicies({super.key});

  @override
  State<MyPolicies> createState() => _MyPoliciesState();
}

class _MyPoliciesState extends State<MyPolicies> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int sliderCurrentIndex = 0;
  List<String> imageUrls = [
    policesslider,
    policesslider,
    policesslider,
    policesslider,
  ];

  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [Text('MyPolicies'), Spacer(), Icon(Icons.add)],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              /*    TabBar(
                controller: tabController,
                indicatorColor: Colors.yellow, // Set selected color to yellow
                tabs: [
                  Tab(text: 'Expired'),
                  Tab(text: 'Active'),
                ],
              ),*/
              /* TabBarView(
                controller: tabController,
                children: [
                  Center(child: Text('Expired Tab Content')),
                  Center(child: Text('Active Tab Content')),
                ],
              ),*/
              /*Container(
                decoration: BoxDecoration(border:
                    Border.all(color: primaryBlack),
                  image: DecorationImage(image: AssetImage(assetName))
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

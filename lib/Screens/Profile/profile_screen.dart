import 'package:flutter/material.dart';
import 'package:soperia_user/Screens/Profile/edit_profile.dart';
import 'package:soperia_user/Screens/Profile/my_policies_screen.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class ProfileScreeen extends StatefulWidget {
  const ProfileScreeen({super.key});

  @override
  State<ProfileScreeen> createState() => _ProfileScreeenState();
}

class _ProfileScreeenState extends State<ProfileScreeen> {
  List menu = [
    mypolicies,
    myrewards,
    myclaims,
    contactus,
    addcomplaints,
    ourwebsite,
    logout,
  ];

  List menuscreen = [
    MyPolicies(),
    MyPolicies(),
    MyPolicies(),
    MyPolicies(),
    MyPolicies(),
    MyPolicies(),
    MyPolicies(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: deepBlue,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(sample)), borderRadius: BorderRadius.circular(100), border: Border.all(color: blue500)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: "Mansi N V", size: 15, fontWeight: FontWeight.bold, txtColor: primaryWhite),
                          AppText(text: "user123@gmail.com", size: 10, fontWeight: FontWeight.bold, txtColor: primaryWhite),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person_add_alt_1,
                            color: primaryWhite,
                            size: 20,
                          ),
                        )),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: menu.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(border: Border.all(color: gold), borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.home,
                                    size: 25,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 25, right: 10),
                              child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => menuscreen[index],
                                      )),
                                  child: AppText(text: menu[index], size: 16)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.chevron_right,
                                size: 20,
                                color: primaryGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: primaryGrey,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(facebooklogo)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(linkedinlogo)),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(instagramlogo)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

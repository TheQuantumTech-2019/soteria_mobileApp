import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

import 'personal_detail_signup_screen.dart';

class OtpScreenSingUp extends StatefulWidget {
  const OtpScreenSingUp({super.key});

  @override
  State<OtpScreenSingUp> createState() => _OtpScreenSingUpState();
}

class _OtpScreenSingUpState extends State<OtpScreenSingUp> {
  @override
  void initState() {
    Timer(const Duration(seconds: 60), () async {
      /*SharedPreferences preferences = await SharedPreferences.getInstance();
      String token = preferences.getString(tokenKey).toString();
      if (token != "null" && token.isNotEmpty) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const DashboardView()), (Route<dynamic> route) => false);
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginView()), (Route<dynamic> route) => false);
      }*/
    });
    super.initState();
  }

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 35,
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppText(text: verification, size: 25, fontWeight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        children: [
                          AppText(text: otpnote, size: 15, maxLine: 2, fontWeight: FontWeight.w200),
                        ],
                      ),
                      Row(
                        children: [
                          AppText(
                            text: "+91-9907678***",
                            txtColor: deepBlue,
                            size: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 5),
                            child: Container(
                              height: 15,
                              width: 20,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(edit))),
                            ),
                          ),
                          AppText(
                            text: editt,
                            txtColor: gold,
                            size: 15,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30,),
                        child: OtpTextField(
                          numberOfFields: 4,
                          fieldWidth: 65,
                          borderRadius: BorderRadius.circular(5),
                          borderColor: Colors.white,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Verification Code"),
                                    content: Text('Code entered is $verificationCode'),
                                  );
                                });
                          }, // end onSubmit
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Text.rich(
                              maxLines: 3,
                              style: TextStyle(fontSize: 10),
                              TextSpan(children: [
                                TextSpan(
                                  text: "Didn’t receive the code?   ",
                                ),
                                TextSpan(text: "Resend", style: TextStyle(color: Colors.blue)),
                              ])),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(

                              child: Row(
                                children: [
                                  Image(width: 12,image: AssetImage(clock)),
                                  SizedBox(width: 5,),
                                  AppText(text: "60:00",size: 10,txtColor: deepBlue,)

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingupScreen(),)),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 280),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(nextImg)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

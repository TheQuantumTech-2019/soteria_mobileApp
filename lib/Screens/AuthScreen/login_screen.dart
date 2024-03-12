import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:soperia_user/Screens/AuthScreen/otp_screen.dart';
import 'package:soperia_user/Screens/SingupScreen/personal_detail_signup_screen.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(splashImg)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: sis,
                      txtColor: Colors.blue.shade700,
                      size: 25,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppText(text: welcome, size: 25, fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      children: [
                        AppText(text: note, size: 15, maxLine: 2, fontWeight: FontWeight.w200),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    IntlPhoneField(
                      decoration: InputDecoration(
                        hintText: entermobileno,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12), borderRadius: BorderRadius.circular(10)),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        children: [
                          Checkbox(
                            value: check,
                            onChanged: (value) {
                              setState(() {
                                check = true;
                              });
                            },
                          ),
                          Expanded(
                            child: Text.rich(
                                maxLines: 3,
                                style: TextStyle(fontSize: 10),
                                TextSpan(children: [
                                  TextSpan(
                                    text: "By SignIn to account, you ag ree to our  and Privacy Policy  ",
                                  ),
                                  TextSpan(text: "Terms and Conditions", style: TextStyle(color: Colors.blue)),
                                  TextSpan(text: "  and"),
                                  TextSpan(text: " Privacy Policy", style: TextStyle(color: Colors.blue)),
                                ])),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                  child: Column(
                    children: [
                      InkWell(onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(),)) ,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(buttonImg)),
                          ),
                        ),
                      ),

              Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: AppText(text: loginwith,size: 12,txtColor: primaryGreyShade3),
                        ),
                        Expanded(child: Divider()),
                      ],
              ),
              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(google)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(fblogo)),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(applelogo)),
                          ),
                        ),
                      ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SingupScreen(),), (route) => false),
                child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: " Don’t have an account?  ",style: TextStyle(color: primaryGrey)),
                          TextSpan(text: " Sign Up",style: TextStyle(color: blue500)),
                        ],
                        ),

                ),
              ),
                    ],
                  ),
                )

            ],
          ),
        ),
      ),
    );
  }
}

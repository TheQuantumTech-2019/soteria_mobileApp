import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soperia_user/Screens/AuthScreen/account_created.dart';
import 'package:soperia_user/Screens/AuthScreen/login_screen.dart';
import 'package:soperia_user/Screens/AuthScreen/otp_screen.dart';
import 'package:soperia_user/Screens/AuthScreen/select_language.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/app_textfileds.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool isPassShow = false;
  bool isPassShowConfirm = false;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 15),
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      child: Icon(Icons.arrow_back, size: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(
                          text: createpassword,
                          size: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    AppText(
                      text: passwordnote,
                      size: 15,
                      maxLine: 2,
                      fontWeight: FontWeight.w200,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    AppTextfield(width: 15, hint: createpassword, lable: createpassword,sufixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassShow = !isPassShow;
                          });
                          print("object");
                        },
                        icon: Icon(!isPassShow ? Icons.visibility : Icons.visibility_off)),
                        obscureText:isPassShow


                    ),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(right))
                        ),),
                      ),
                      AppText(text: passwordrule,size: 15,txtColor: green,)
                    ],),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(alert))
                        ),),
                      ),
                      AppText(text: passwordalert,size: 15,txtColor: redshad500,)
                    ],),
                    SizedBox(
                      height: 10,
                    ),
                    AppTextfield(width: 15, hint: confirmpassword, lable: confirmpassword,sufixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassShowConfirm = !isPassShowConfirm;
                          });
                          print("object");
                        },

                        icon: Icon(!isPassShowConfirm ? Icons.visibility : Icons.visibility_off)),
                        obscureText:isPassShowConfirm
                    ),
                  ],
                ),
              ),
              SizedBox(height: 160,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountCreated(),
                          )),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(createaccImg)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SelectLanguage(),), (route) => false),
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: " Already have an account?  ",style: TextStyle(color: primaryGrey)),
                          TextSpan(text: " Log In",style: TextStyle(color: blue500)),
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

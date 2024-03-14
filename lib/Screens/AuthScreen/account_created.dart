import 'package:flutter/material.dart';
import 'package:soperia_user/Screens/HomeScreen/home_screen_bottom.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({super.key});

  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(acccreated)),
              SizedBox(
                height: 15,
              ),
              AppText(
                text: congratulations,
                fontWeight: FontWeight.bold,
                size: 25,
              ),
              AppText(
                txtAlign: TextAlign.center,
                text: congratulationsnote,
                size: 18,
                maxLine: 3,
                fontWeight: FontWeight.w200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                child: InkWell(
                  /* onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(),
                      )),*/
                  child: InkWell(
                    onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePageBottomNav(),),(route) => false),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(getstartedbtn)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ();
  }
}

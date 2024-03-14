import 'package:flutter/material.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class HomeInsurance extends StatefulWidget {
  const HomeInsurance({super.key});

  @override
  State<HomeInsurance> createState() => _HomeInsuranceState();
}

class _HomeInsuranceState extends State<HomeInsurance> {
  List imgs=[
    liclogo,
    liclogo,
    liclogo,
    liclogo,
    liclogo,
    liclogo,
    liclogo,
    liclogo,
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: AppText(text: home+" "+" "+insurance,size: 20,fontWeight: FontWeight.bold,),
      ),
      body: ListView.builder(itemCount: imgs.length,itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                child: Container(

                  decoration: BoxDecoration(
                    border: Border.all(color: gold),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(image: AssetImage(liclogo))
                              ),
                            ),
                            SizedBox(height: 5,),
                            AppText(text: "LIC",size: 12,)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15 ,top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(text: "LIC Secure Home Plan",size: 15,fontWeight:  FontWeight.bold,),
                            AppText(text: "Unlimited offers for you and your family\n Unlimited offers for you",size: 10,txtColor: primaryGrey,),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(text: "₹ 1 Lakh Term Plan",txtColor: deepBlue,fontWeight: FontWeight.bold,size: 15),
                            AppText(text: "Starting from ₹1/month",txtColor: gold,fontWeight: FontWeight.bold,size: 12),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },)

    );
  }
}

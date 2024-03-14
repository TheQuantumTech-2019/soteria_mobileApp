import 'package:flutter/material.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/app_textfileds.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class OfficeInsurance extends StatefulWidget {
  const OfficeInsurance({super.key});

  @override
  State<OfficeInsurance> createState() => _OfficeInsuranceState();
}

class _OfficeInsuranceState extends State<OfficeInsurance> {
  List names=[
    mobileno,
    email
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: office + " " + " " + insurance, size: 20, fontWeight: FontWeight.bold,),
      ),
      body: Column(
        children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppText(text: "Before we proceed \n We need some details of yours",size: 20,fontWeight: FontWeight.bold,),
      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextfield(width: 10, hint: mobileno, lable: mobileno),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextfield(width: 10, hint: email, lable: email),
          ),
        ],
      ),
    );
  }
}

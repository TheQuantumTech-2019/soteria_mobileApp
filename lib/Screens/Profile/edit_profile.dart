import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soperia_user/Screens/SingupScreen/create_password.dart';
import 'package:soperia_user/Screens/AuthScreen/otp_screen.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/app_textfileds.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool check = false;
  String selectedGender="Male";
  TextEditingController startDateController=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 35,
                  child: Icon(Icons.arrow_back,size: 25),
                ),
                SizedBox(width: 5,),
                AppText(text: editprofile,size: 15,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 18,
                ),
                AppTextfield(width: 15, hint: name, lable: name),
                SizedBox(height: 10,),
                AppTextfield(width: 15, hint: email, lable: email),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                  child: DropdownButtonFormField(
                    value: selectedGender,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                    hint: Text('Select Gender'),
                    onChanged: (newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: ['Male', 'Female', 'Other']
                        .map((gender) => DropdownMenuItem(
                      child: Text(gender),
                      value: gender,
                    ))
                        .toList(),
                  ),
                ),
                AppTextfield(width: 10,readOnly: true, hint: "DOB", lable: "Dob",controller:startDateController,ontap: (){
                  startDateDialog();
                }),
                SizedBox(height: 10,),
                AppTextfield(width: 15, hint: address, lable: address),
                AppTextfield(width: 15, hint: address, lable: address),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            child: Column(
              children: [
                InkWell(onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePassword(),)) ,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(savenextImg)),
                    ),
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
  startDateDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime.now(), //get today's date
      firstDate: DateTime(1901), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      print(pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      //endDate = formattedDate;

      setState(() {
        startDateController.text = formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}


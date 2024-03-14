import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:soperia_user/Screens/SingupScreen/create_password.dart';
import 'package:soperia_user/Screens/AuthScreen/otp_screen.dart';
import 'package:soperia_user/app_utils/app_imgs.dart';
import 'package:soperia_user/app_utils/app_string.dart';
import 'package:soperia_user/app_utils/app_text.dart';
import 'package:soperia_user/app_utils/app_textfileds.dart';
import 'package:soperia_user/app_utils/color_constrint.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool check = false;
  String selectedGender = "Male";
  TextEditingController startDateController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(sample)),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: blue500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 18),
                    AppTextfield(width: 15, hint: name, lable: name),
                    SizedBox(height: 10),
                    AppTextfield(width: 15, hint: email, lable: email),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                      child: DropdownButtonFormField(
                        value: selectedGender,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                        hint: Text('Select Gender'),
                        onChanged: (newValue) {
                          setState(() {
                            selectedGender = newValue.toString();
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
                    AppTextfield(width: 10, readOnly: true, hint: "DOB", lable: "Dob", controller: startDateController,sufixicon:IconButton(onPressed: () {
                      
                    }, icon:Icon(Icons.calendar_month,color: deepBlue,)) , ontap: () {
                      startDateDialog();
                    }),
                    SizedBox(height: 10),
                    AppTextfield(width: 15, hint: address, lable: address),
                    SizedBox(height: 18),
                    AppTextfield(lable:mobileno ,width: 15, hint: mobileno, keyboardType: TextInputType.number,sufixicon:IconButton(onPressed: () {

                    }, icon:Icon(Icons.lock_outline,color: deepBlue,)) , ontap: () {
                      startDateDialog();
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePassword())),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(save)),
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

  startDateDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1901),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      setState(() {
        startDateController.text = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }
}

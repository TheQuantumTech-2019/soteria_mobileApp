import 'package:flutter/material.dart';

import 'color_constrint.dart';

class AppButton extends StatelessWidget {
  final String text;
  Color? txtColor;
  Color? buttonColor;
  BorderRadius? redius;
  double? size;
  FontWeight? fontWeight;
  Color? borderColor;

  double? borderWidth;
  double? width;
  double? height;
  Function? onTap;
  EdgeInsetsGeometry? padding;
  String? fontFamily;
  bool? isShadow;
  Color? shadowColor;
  bool? isElevation;
  bool? isLoad;

  AppButton({Key? key, required this.text,this.isElevation= true,this.isLoad, this.width, this.height, this.shadowColor,this.isShadow=false,this.padding, this.txtColor, this.size, this.fontWeight, this.fontFamily, this.redius, this.borderColor, this.borderWidth, this.buttonColor, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Card(
        elevation: isElevation! ? 5 : 0,
        margin: EdgeInsets.zero,
        shape: OutlineInputBorder(
            borderRadius: redius ?? BorderRadius.circular(8),
            borderSide:  BorderSide(color: borderColor ?? primaryWhite,width: 0.8)
        ),
        child: Container(
          height: height ?? 46,
          width: width ?? double.infinity,
          padding: padding ?? EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: redius ?? BorderRadius.circular(8), color: buttonColor ?? Colors.red, border: Border.all(color: borderColor ?? buttonColorApp, width: borderWidth ?? 1.0),
              boxShadow: isShadow! ? [BoxShadow(
                color: shadowColor!,
                blurRadius: 8,
              )]:[]),
          child:isLoad??false?CircularProgressIndicator(color: primaryWhite): Text(text, style: TextStyle(fontFamily: fontFamily ?? "Inter_Regular", color: txtColor ?? Colors.white, fontSize: size ?? 16, fontWeight: fontWeight ?? FontWeight.normal)),
        ),
      ),
    ); //getternsleted(context,key)
  }
}
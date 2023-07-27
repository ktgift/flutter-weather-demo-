import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Textfield_radius50 extends StatelessWidget {
  bool obscureText = false;
  TextEditingController? controller;
  String? labelText;
  bool? enabled;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  int? maxLength;
  int? maxLine;
  TextAlign? textAlign;
  double? height;
  double? width;

  Textfield_radius50({Key? key,
    bool obscureText = false,
    TextEditingController? controller,
    String? labelText,
    bool? enabled,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int? maxLength,
    int? maxLine,
    TextAlign? textAlign,
    double? height,
    double? width,
    })
    : super(key: key) {
    this.obscureText = obscureText;
    this.controller = controller;
    this.labelText = labelText; // Use "this" to refer to the class field.
    this.enabled = enabled;
    this.keyboardType = keyboardType;
    this.textInputAction = textInputAction;
    this.maxLength = maxLength;
    this.maxLine = maxLine;
    this.textAlign = textAlign ?? TextAlign.start;
    this.height = height;
    this.width = width;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        enabled: enabled,
        textAlign: textAlign!,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        maxLength: maxLength,
        maxLines: maxLine,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          labelText: labelText,
          
        ),
        onSubmitted: (value) {
          // ถ้า textInputAction = TextInputAction.next จะมาเรียก function นี้
          print('value: $value');
          FocusScope.of(context).nextFocus(); // ย้ายโฟกัสไปยังวิดเจ็ตที่สามารถให้โฟกัสต่อไปได้
        },
      ),
    );
  }
}
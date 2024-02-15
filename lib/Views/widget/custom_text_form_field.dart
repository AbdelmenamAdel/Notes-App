import 'package:flutter/material.dart';
import 'package:notes_app/Views/constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.onSaved,
    this.onChange,
    this.suffixOnPressed1,
    this.suffixOnPressed2,
    this.onSubmit,
    this.onTap,
    this.validator,
    this.prefix,
    this.type,
    this.suffix1,
    this.suffix2,
    this.labelText,
    this.hintText,
    this.height = 65,
    this.width = double.infinity,
    this.readOnly = false,
    this.prefixOnPressed,
    this.radius = 5,
    this.maxLines = 1,
  });
  String? labelText;
  double radius;
  int maxLines;
  String? hintText;
  bool readOnly;
  double? width;
  double? height;
  IconData? prefix;
  IconData? suffix1;
  IconData? suffix2;
  TextInputType? type;
  bool obscureText = false;
  TextInputType? keyboardType;
  Function(String?)? onSaved;
  Function(String?)? onChange;
  Function(String?)? onSubmit;
  VoidCallback? onTap;
  VoidCallback? suffixOnPressed1;
  VoidCallback? suffixOnPressed2;
  VoidCallback? prefixOnPressed;
  String? Function(String?)? validator;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            readOnly: readOnly,
            maxLines: maxLines,
            onTap: onTap,
            onSaved: onSaved,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'this field is required';
              } else {
                return null;
              }
            },
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
                prefixIcon: prefix == null
                    ? null
                    : IconButton(
                        onPressed: prefixOnPressed,
                        icon: Icon(prefix),
                        color: Colors.white,
                      ),
                suffixIcon: suffix2 == null
                    ? IconButton(
                        iconSize: 24,
                        onPressed: suffixOnPressed1,
                        icon: Icon(
                          suffix1,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min, // added line
                        children: [
                          IconButton(
                            iconSize: 24,
                            onPressed: suffixOnPressed1,
                            icon: Icon(
                              suffix1,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            iconSize: 24,
                            onPressed: suffixOnPressed2,
                            icon: Icon(
                              suffix2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                hintText: hintText,
                // hintStyle: const TextStyle(color: kPrimaryColor),
                labelText: labelText,
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: buildBorder(),
                border: buildBorder(kPrimaryColor),
                errorBorder: buildBorder(red),
                focusedBorder: buildBorder(kPrimaryColor)),
            obscureText: obscureText,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? white, width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }
}

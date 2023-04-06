import 'package:da22023/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final String labelText;
  final TextFieldType textFieldType;
  final TextFieldWidth textFieldWidth;
  final double width;


  CustomTextField({
    required this.onChanged,
    this.labelText = '',
    this.obscureText = false,   
    this.textFieldType = TextFieldType.black,
    this.textFieldWidth = TextFieldWidth.value,
    this.width = 320,

  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: widget.textFieldWidth == TextFieldWidth.value ? widget.width : double.infinity,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: _controller,
        // ignore: prefer_const_constructors
        decoration: widget.textFieldType == TextFieldType.black
            ? InputDecoration(
                labelText: widget.labelText,
                labelStyle: TextStyle(color: PrimaryColor1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor1),
                ),
              )
            : InputDecoration(
                labelText: widget.labelText,
                labelStyle: TextStyle(color: PrimaryColor2),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PrimaryColor2),
                ),
              ),
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

enum TextFieldType {
  white,
  black,
}

enum TextFieldWidth {
  value,
  fill,
}

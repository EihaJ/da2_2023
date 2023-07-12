import 'package:da22023/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final String labelText;
  final TextFieldType textFieldType;
  final TextFieldWidth textFieldWidth;
  final ShowEdit showEdit;
  final double width;
  final String initialText;
  bool isReadOnly; // New property for initial text

  CustomTextField({
    required this.onChanged,
    this.labelText = '',
    this.obscureText = false,
    this.textFieldType = TextFieldType.black,
    this.textFieldWidth = TextFieldWidth.value,
    this.showEdit = ShowEdit.no,
    this.width = 320,
    this.initialText = '', // Set default value for initial text
    this.isReadOnly = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    bool readOnly = widget.isReadOnly;
    return Container(
      width: widget.textFieldWidth == TextFieldWidth.value
          ? widget.width
          : double.infinity,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            style: widget.textFieldType != TextFieldType.black
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black),
            controller: _controller,
            readOnly: widget.isReadOnly,
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
          if (widget.isReadOnly == true)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
            ),
        ],
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

enum ShowEdit {
  yes,
  no,
}

import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final ButtonType buttonType;

  CTAButton({
    required this.onPressed,
    required this.text,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        buttonType == ButtonType.primary ? Colors.black : Colors.white;
    Color textColor = buttonType == ButtonType.primary
        ? Colors.white
        : Theme.of(context).primaryColor;

    return InkResponse(
      splashColor: Colors.transparent,
      enableFeedback: false,
      onTap: onPressed,
      child: Container(
        height: 48,
        width: 320,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: buttonType == ButtonType.primary
                      ? Colors.white
                      : Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary,
}

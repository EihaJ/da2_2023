import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final ButtonType buttonType;
  final ButtonWidth buttonWidth;

  CTAButton({
    required this.onPressed,
    required this.text,
    this.buttonType = ButtonType.primary,
    this.buttonWidth = ButtonWidth.fixed,
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
        width: buttonWidth == ButtonWidth.fixed ? 320 : double.infinity,
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

enum ButtonWidth {
  fixed,
  fill,
}

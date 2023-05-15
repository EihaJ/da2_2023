import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final ButtonType buttonType;
  final ButtonWidth buttonWidth;
  final LeadIcon leadIcon;
  final Icon leadIconName;
  final TailIcon tailIcon;
  final Icon tailIconName;

  CTAButton({
    required this.onPressed,
    required this.text,
    this.buttonType = ButtonType.primary,
    this.buttonWidth = ButtonWidth.fixed,
    this.leadIcon = LeadIcon.hide,
    this.leadIconName = const Icon(Icons.abc),
    this.tailIcon = TailIcon.hide,
    this.tailIconName = const Icon(Icons.person),
  })  : assert(validLeadIcons.contains(leadIcon)),
        assert(validTailIcons.contains(tailIcon));

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadIcon == LeadIcon.show) leadIconName,
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: buttonType == ButtonType.primary
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
              const SizedBox(
                width: 8,
              ),
              if (tailIcon == TailIcon.show) tailIconName,
            ],
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

enum LeadIcon {
  hide,
  show,
}

const List<LeadIcon> validLeadIcons = const [LeadIcon.hide, LeadIcon.show];

enum TailIcon {
  hide,
  show,
}

const List<TailIcon> validTailIcons = const [TailIcon.hide, TailIcon.show];

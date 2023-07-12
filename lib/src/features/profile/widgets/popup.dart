import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_models/cart.dart';
import '../../authentication/controllers/auth_controller.dart';

class ConfirmPopup extends StatefulWidget {
  String? title;
  String? subtittle;
  int? numberButton = 0;
  String? button1;
  VoidCallback? onTap1;
  String? button2;
  VoidCallback? onTap2;

  ConfirmPopup(
      {this.title,
      this.subtittle,
      this.numberButton,
      this.button1,
      this.onTap1,
      this.button2,
      this.onTap2});

  @override
  State<ConfirmPopup> createState() => _ConfirmPopupState();
}

class _ConfirmPopupState extends State<ConfirmPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.end,
      title: Text(
        widget.title.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.black),
      ),
      content: Text(
        widget.subtittle.toString(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        widget.numberButton == 0 || widget.numberButton == null
            ? Container()
            : widget.numberButton == 1
                ? TextButton(
                    onPressed: widget.onTap1,
                    child: Text(
                      widget.button1.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ))
                : Row(
                    children: [
                      TextButton(
                        onPressed: widget.onTap1,
                        child: Text(
                          widget.button1.toString(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                          onPressed: widget.onTap2,
                          child: Text(
                            widget.button2.toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ))
                    ],
                  ),
      ],
    );
  }
}

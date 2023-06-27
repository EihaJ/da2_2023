import 'package:flutter/material.dart';

class AdjustableQuantity extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue;
  final double buttonSize;
  final double iconSize;
  final double textSize;
  final double distance;
  final Color themeColor;

  const AdjustableQuantity(
      {Key? key,
      required this.onChanged,
      required this.initialValue,
      this.textSize = 20,
      this.buttonSize = 32,
      this.iconSize = 20,
      this.distance = 16,
      this.themeColor = Colors.black})
      : super(key: key);

  @override
  _AdjustableQuantityState createState() => _AdjustableQuantityState();
}

class _AdjustableQuantityState extends State<AdjustableQuantity> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue.toInt();
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        widget.onChanged(_quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AdjustButton(
          icon: Icons.remove,
          onPressed: _decrementQuantity,
          buttonSize: widget.buttonSize,
          iconSize: widget.iconSize,
          buttonColor: widget.themeColor,
        ),
        SizedBox(width: widget.distance),
        Text(
          '$_quantity',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: widget.themeColor, fontSize: widget.textSize),
        ),
        SizedBox(width: widget.distance),
        AdjustButton(
          icon: Icons.add,
          onPressed: _incrementQuantity,
          buttonSize: widget.buttonSize,
          iconSize: widget.iconSize,
          buttonColor: widget.themeColor,
        ),
      ],
    );
  }
}

class AdjustButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double buttonSize;
  final double iconSize;
  final Color buttonColor;

  const AdjustButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.buttonSize = 32.0,
    this.iconSize = 20.0,
    this.buttonColor = Colors.black,
  }) : super(key: key);

  @override
  _AdjustButtonState createState() => _AdjustButtonState();
}

class _AdjustButtonState extends State<AdjustButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: widget.onPressed,
      child: Container(
        width: widget.buttonSize,
        height: widget.buttonSize,
        decoration: BoxDecoration(
          color: widget.buttonColor == Colors.black
              ? _isPressed
                  ? Colors.black
                  : Colors.white
              : _isPressed
                  ? Colors.white
                  : Colors.black.withOpacity(0),
          border: Border.all(
              color: widget.buttonColor == Colors.black
                  ? _isPressed
                      ? Colors.white
                      : Colors.black
                  : _isPressed
                      ? Colors.black
                      : Colors.white),
        ),
        child: Center(
          child: Icon(widget.icon,
              size: widget.iconSize,
              color: widget.buttonColor == Colors.black
                  ? _isPressed
                      ? Colors.white
                      : Colors.black
                  : _isPressed
                      ? Colors.black
                      : Colors.white),
        ),
      ),
    );
  }
}

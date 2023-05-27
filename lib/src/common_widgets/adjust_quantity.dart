import 'package:flutter/material.dart';

class AdjustableQuantity extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue;

  const AdjustableQuantity({
    Key? key,
    required this.onChanged,
    this.initialValue = 1,
  }) : super(key: key);

  @override
  _AdjustableQuantityState createState() => _AdjustableQuantityState();
}

class _AdjustableQuantityState extends State<AdjustableQuantity> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
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
        AdjustButton(icons: Icons.remove, onPressed: _decrementQuantity),
        const SizedBox(width: 16),
        Text(
          '$_quantity',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 16),
        AdjustButton(icons: Icons.add, onPressed: _incrementQuantity),
      ],
    );
  }
}

class AdjustButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icons;

  const AdjustButton({
    Key? key,
    required this.icons,
    required this.onPressed,
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
        decoration: BoxDecoration(
          color: _isPressed ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          widget.icons,
          color: _isPressed ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

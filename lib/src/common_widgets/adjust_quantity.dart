import 'package:flutter/material.dart';

class AdjustableQuantity extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue;
  final double buttonSize;
  final double iconSize;
  final double textSize;
  final double distance;

  const AdjustableQuantity({
    Key? key,
    required this.onChanged,
    this.initialValue = 1,
    this.textSize = 20,
    this.buttonSize = 32,
    this.iconSize = 20,
    this.distance = 16,
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
        AdjustButton(
          icon: Icons.remove,
          onPressed: _decrementQuantity,
          buttonSize: widget.buttonSize,
          iconSize: widget.iconSize,
        
        ),
        SizedBox(width: widget.distance),
        Text(
          '$_quantity',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black ,fontSize: widget.textSize),
        ),
        SizedBox(width: widget.distance),
        AdjustButton(
          icon: Icons.add,
          onPressed: _incrementQuantity,
          buttonSize: widget.buttonSize,
          iconSize: widget.iconSize,
     
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


  const AdjustButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.buttonSize = 32.0,
    this.iconSize = 20.0,
  
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
          color: _isPressed ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black),
        ),
        
        child: Center(
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: _isPressed ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

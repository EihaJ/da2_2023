import 'package:flutter/material.dart';

import '../../../common_widgets/adjust_quantity.dart';

class OptionsCheckbox extends StatefulWidget {
  @override
  _OptionsCheckboxState createState() => _OptionsCheckboxState();
}

class _OptionsCheckboxState extends State<OptionsCheckbox> {
  int _clickedIndex = 0; // Set the first checkbox as clicked by default
  int _numberOfCopies = 1; // Number of copies selected

  List<bool> _isClickedList = [];

  List<String> buttonTitles = [
    "Extended Playing",
    "Long Playing",
    "Standard Playing",
    "Compact Disc",
    // Add more button titles as needed
  ];

  List<double> buttonPrices = [
    9.99,
    14.99,
    19.99,
    24.99,
    // Add corresponding prices for each button
  ];

  @override
  void initState() {
    super.initState();
    _isClickedList = List.generate(buttonTitles.length, (index) => false);
    _isClickedList[_clickedIndex] = true; // Set the first checkbox as clicked
  }

  void _onButtonPressed(int index) {
    setState(() {
      if (_clickedIndex == index) {
        _clickedIndex = -1;
        _isClickedList[index] = false;
      } else {
        _clickedIndex = index;
        for (int i = 0; i < _isClickedList.length; i++) {
          _isClickedList[i] = (i == index);
        }
      }
    });
  }

  void _onNumberOfCopiesChanged(int value) {
    setState(() {
      _numberOfCopies = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: buttonTitles.length,
          itemBuilder: (context, index) {
            return CustomButton(
              text: buttonTitles[index],
              isClicked: _isClickedList[index],
              price: buttonPrices[index],
              onPressed: () {
                _onButtonPressed(index);
                // Handle button pressed action
              },
            );
          },
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'AMOUNT',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w300),
            ),
            AdjustableQuantity(
              onChanged: _onNumberOfCopiesChanged,
              initialValue: _numberOfCopies,
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TOTAL PRICE:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w300),
            ),
            Text(
              '\$${(_clickedIndex != -1 ? buttonPrices[_clickedIndex] * _numberOfCopies : 0.00).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final bool isClicked;
  final double price;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.isClicked,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isClicked ? Colors.black.withOpacity(0.7) : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: !isClicked ?  Colors.black.withOpacity(0.8) :Colors.white,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}

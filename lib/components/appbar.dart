import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class appBar extends StatefulWidget implements PreferredSizeWidget {


  const appBar({Key? key}) : super(key: key);

  @override
  _appBarState createState() => _appBarState();

  @override
  Size get preferredSize => Size.fromHeight(72);
}

class _appBarState extends State<appBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(80, 0, 80, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 50,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/WebAssets%2FLogo.png?alt=media&token=af5c3bc5-05f1-42d5-9800-7e4865752c55',
                width: 240,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            CustomButtonRow(),
            CustomIconButtonRow(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String text;
  final bool isClicked;
  final VoidCallback onPressed;

  CustomButton(
      {required this.text, required this.isClicked, required this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final hoverColor = widget.isClicked? ;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: InkResponse(
        enableFeedback: false,
        highlightShape: BoxShape.rectangle,
        highlightColor: theme.canvasColor,
        onTap: widget.onPressed,
        onHover: (value) {
          setState(() {
            _isHovered = value;
          });
        },
        child: Container(
          width: 100,
          height: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 21),
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              if (widget.isClicked || _isHovered)
                Container(
                  height: 2,
                  color:
                      widget.isClicked ? theme.primaryColor : Color(0xFFDBDBDB),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonRow extends StatefulWidget {
  @override
  _CustomButtonRowState createState() => _CustomButtonRowState();
}

class _CustomButtonRowState extends State<CustomButtonRow> {
  int _clickedIndex = -1;

  List<bool> _isClickedList = List.generate(5, (index) => false);

  void _onButtonPressed(int index) {
    setState(() {
      if (_clickedIndex == index) {
        _clickedIndex = -1;
        _isClickedList[index] = false;
      } else {
        _clickedIndex = index;
        for (int i = 0; i < _isClickedList.length; i++) {
          _isClickedList[i] = false;
        }
        _isClickedList[index] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: "Home",
          isClicked: _isClickedList[0],
          onPressed: () => _onButtonPressed(0),
        ),
        CustomButton(
          text: "Shop",
          isClicked: _isClickedList[1],
          onPressed: () => _onButtonPressed(1),
        ),
        CustomButton(
          text: "Event",
          isClicked: _isClickedList[2],
          onPressed: () => _onButtonPressed(2),
        ),
        CustomButton(
          text: "Blog",
          isClicked: _isClickedList[3],
          onPressed: () => _onButtonPressed(3),
        ),
        CustomButton(
          text: "About Us",
          isClicked: _isClickedList[4],
          onPressed: () => _onButtonPressed(4),
        ),
      ],
    );
  }
}

class CustomIconButtonRow extends StatefulWidget {
  const CustomIconButtonRow({super.key});

  @override
  State<CustomIconButtonRow> createState() => _CustomIconButtonRowState();
}

class _CustomIconButtonRowState extends State<CustomIconButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
          iconSize: 26,
          onPressed: () => print('Search'),
          icon: Icon(Icons.search_outlined),
        ),
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 16),
          iconSize: 26,
          onPressed: () => print('Cart'),
          icon: Icon(Icons.shopping_bag_outlined),
        ),
        //TODO: Nếu đã login thì hiển thị Ảnh đại diện cùng tên(First name only) người ta bên phải
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 16),
          iconSize: 26,
          onPressed: () => print('Account'),
          icon: Icon(Icons.login_outlined),
        ),
      ],
    );
  }
}

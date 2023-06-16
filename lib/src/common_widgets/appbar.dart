import 'package:da22023/src/common_models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/image_strings.dart';
import '../constants/colors.dart';

import '../features/search/screens/search.dart';

import '../features/cart/controllers/cart_controller.dart';
import '../features/cart/screens/cart.dart';

import '../features/authentication/controllers/auth_controller.dart';

class appBarCustom extends StatefulWidget implements PreferredSizeWidget {

  @override
  _appBarState createState() => _appBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(72); // Set the preferred size of the app bar
}

class _appBarState extends State<appBarCustom> {
  final AuthController _authController = Get.find();

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
            color: PrimaryColor1.withOpacity(0.1),
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
              child: InkResponse(
                child: Image.asset(
                  logo_black,
                  width: 240,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Get.toNamed("/");
                },
              ),
            ),
            CustomButtonRow(),
            Obx(() {
              final userID = _authController.uid.value;
              final authenticatedUser = _authController.authenticatedUser.value;
              final user = authenticatedUser as UserFirebase?;

              return CustomIconButtonRow(
                userID: userID,
                user: user,
              );
            }),
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
        //Homepage Button
        CustomButton(
          text: "Home",
          isClicked: _isClickedList[0],
          onPressed: () {
            _onButtonPressed(0);
            Get.toNamed("/");
          },
        ),

        //Shop Button
        CustomButton(
          text: "Shop",
          isClicked: _isClickedList[1],
          onPressed: () {
            _onButtonPressed(1);
            Get.toNamed("/shop");
          },
        ),

        //Blog Button
        CustomButton(
            text: "Blog",
            isClicked: _isClickedList[3],
            onPressed: () {
              _onButtonPressed(3);
              Get.toNamed('/blog');
            }),

        //About Us Button
        CustomButton(
          text: "About Us",
          isClicked: _isClickedList[4],
          onPressed: () {
            _onButtonPressed(4);
            Get.toNamed("/about_us");
          },
        ),
      ],
    );
  }
}

class CustomIconButtonRow extends StatelessWidget {
  final String userID;
  final UserFirebase? user;

  CustomIconButtonRow({required this.userID, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
          iconSize: 26,
          onPressed: () {
            print('search');
            Get.dialog(SearchScreen());
          },
          icon: Icon(Icons.search_outlined),
        ),
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 16),
          iconSize: 26,
          onPressed: () {
            Scaffold.of(context).openEndDrawer();

            // This is where you click to open the drawer
            print('cart open');
          },
          icon: Icon(Icons.shopping_bag_outlined),
        ),
        if (userID.isEmpty)
          IconButton(
            icon: Icon(Icons.login_outlined),
            padding: EdgeInsets.symmetric(horizontal: 16),
            iconSize: 26,
            onPressed: () {
              Get.toNamed("/login");
              print(Get.currentRoute);
            },
          )
        else
          InkWell(
            onTap: () {
              print(user!.avatarImageLink);
            },
            child: PopupMenuButton(
              offset: const Offset(0, 36),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text(
                        'Profile',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      onTap: () {
                        // Go to it Profile
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.logout_outlined),
                      title: Text(
                        'Log out',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      onTap: () {
                        Get.find<AuthController>().logout();
                      },
                    ),
                  ),
                ];
              },
              child: ClipOval(
                child: Image.network(
                  user!.avatarImageLink,
                  height: 32,
                  width: 32,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

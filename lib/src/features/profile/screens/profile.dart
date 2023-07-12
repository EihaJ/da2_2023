import 'package:da22023/src/common_widgets/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'dart:html';
import 'dart:io';
import 'dart:math';

import '../../../common_models/user.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../authentication/controllers/auth_controller.dart';

import '../../../common_widgets/appbar.dart';
import '../../../common_widgets/footer.dart';
import '../../../common_widgets/text_field.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../cart/screens/cart.dart';

import '../../../utilities/theme.dart';

import '../widgets/popup.dart';

RxString sectionController = 'profile'.obs;

class UserProfileScreen extends StatefulWidget {
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final AuthController _authController = Get.find();
  final CartController _cartController = Get.find();

  UserFirebase? user;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    user = await UserFirebase.getUserById(_authController.uid.string);
    setState(() {}); // Trigger a rebuild after getting the user
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(),
      endDrawer: CartDrawer(
        cartController: _cartController,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 160),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(4, 12), // vertical offset
                        ),
                      ]),
                  width: 280,
                  height: 320,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.grey.withOpacity(0.01),
                        ),
                        InkWell(
                          onTap: () {
                            sectionController.value = 'profile';
                            print(sectionController.value);
                          },
                          child: Text(
                            'Profile Information',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        InkWell(
                          onTap: () {
                            sectionController.value = 'changePassword';
                            print(sectionController.value);
                          },
                          child: Text(
                            'Change Password',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        InkWell(
                          onTap: () {
                            sectionController.value = 'order';
                            print(sectionController.value);
                          },
                          child: Text(
                            'Order Management',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        InkWell(
                          onTap: () {
                            Get.find<AuthController>().logout();
                          },
                          child: Text(
                            'Log Out',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.01),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() => sectionController.value == 'profile'
                      ? ProfileScreen(
                          userFirebase: user,
                        )
                      : Placeholder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  UserFirebase? userFirebase;
  ProfileScreen({required this.userFirebase});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _postCount = 6; // Initial number of brand cards to display

  RxList<int> _amount = [0].obs;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        if (_postCount >= widget.userFirebase!.addressNumber) {
          // No more items to load
          _postCount = widget.userFirebase!.addressNumber;
        } else {
          _postCount += 6;
        }
      });
    }
  }

  @override
  void _handleImageUpload(dynamic event) async {
    final fileList = (event.target as FileUploadInputElement).files!;
    if (fileList.length > 0) {
      final file = fileList[0];
      final fileName = path.basename(file.name);
      final firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('UserImage/$fileName'); // Specify the folder name

      try {
        await firebaseStorageRef.putBlob(file);
        final downloadUrl = await firebaseStorageRef.getDownloadURL();

        setState(() {
          // image.value = downloadUrl;
        });
      } catch (error) {
        print('Failed to upload image: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    RxString image = widget.userFirebase!.avatarImageLink.obs;
    RxString userName = widget.userFirebase!.name.obs;
    RxString email = widget.userFirebase!.emailAddress.obs;
    RxString phoneNumber = widget.userFirebase!.phoneNumber.obs;
    RxString age = widget.userFirebase!.age.toString().obs;
    List<RxString> addresses = [];
    for (int i = 0; i < widget.userFirebase!.addressNumber; i++) {
      RxString address = widget.userFirebase!.addresses[i].obs;
      addresses.add(address);
    }

    RxBool isReadOnly = true.obs;
    RxBool isReadOnly2 = true.obs;

    return Padding(
      padding: const EdgeInsets.only(left: 80, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MY ACCOUNT',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Manage profile information for account security',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(color: Colors.grey.withOpacity(0.3)),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        image.value,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CTAButton(
                      onPressed: () {
                        final input = FileUploadInputElement();
                        input.accept = 'image/*';
                        input.onChange.listen(_handleImageUpload);
                        input.click();
                      },
                      text: 'EDIT AVATAR',
                      width: 280,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 340,
                  width: 1,
                  child: VerticalDivider(
                    width: 40,
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Obx(() => isReadOnly.value == true
                    ? Column(
                        children: [
                          CustomTextField(
                            initialText: email.value,
                            onChanged: (value) {
                              email.value = value;
                            },
                            labelText: 'Email',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: true,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            initialText: userName.value,
                            onChanged: (value) {
                              userName.value = value;
                            },
                            labelText: 'Username',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: true,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            initialText: age.value,
                            onChanged: (value) {
                              age.value = value;
                            },
                            labelText: 'Age',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: true,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            initialText: phoneNumber.value,
                            onChanged: (value) {
                              phoneNumber.value = value;
                            },
                            labelText: 'Phone Number',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: true,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          CTAButton(
                              onPressed: () {
                                isReadOnly.value = false;
                              },
                              text: 'CHANGE INFORMATION')
                        ],
                      )
                    : Column(
                        children: [
                          CustomTextField(
                            initialText: email.value,
                            onChanged: (value) {
                              email.value = value;
                            },
                            labelText: 'Email',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: true,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            initialText: userName.value,
                            onChanged: (value) {
                              userName.value = value;
                            },
                            labelText: 'Username',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: false,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            initialText: age.value,
                            onChanged: (value) {
                              age.value = value;
                            },
                            labelText: 'Age',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: false,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            initialText: phoneNumber.value,
                            onChanged: (value) {
                              phoneNumber.value = value;
                            },
                            labelText: 'Phone Number',
                            textFieldWidth: TextFieldWidth.value,
                            showEdit: ShowEdit.yes,
                            isReadOnly: false,
                            width: 480,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          CTAButton(
                            onPressed: () {
                              Get.dialog(
                                ConfirmPopup(
                                  title: 'APPLY CHANGES',
                                  subtittle: 'Do you want to save changes?',
                                  numberButton: 2,
                                  button1: 'No',
                                  onTap1: () {
                                    Get.back();
                                  },
                                  button2: 'Yes',
                                  onTap2: () async {
                                    final AuthController _authController =
                                        Get.find();

                                    UserFirebase userFirebase1 = UserFirebase(
                                      uid: widget.userFirebase!.uid,
                                      name: userName.value,
                                      role: 'user',
                                      age: int.parse(age.value),
                                      avatarImageLink: image.value,
                                      addresses: widget.userFirebase!.addresses,
                                      phoneNumber: phoneNumber.value,
                                      emailAddress: _authController
                                          .authenticatedUser
                                          .value!
                                          .emailAddress,
                                      password: _authController
                                          .authenticatedUser.value!.password,
                                      addressNumber:
                                          widget.userFirebase!.addressNumber,
                                    );
                                    print(userFirebase1.phoneNumber);

                                    try {
                                      await userFirebase1.update();
                                      Get.offAndToNamed('/');
                                    } catch (error) {
                                      print(
                                          'Failed to update user information: $error');
                                    }
                                  },
                                ),
                              );
                              isReadOnly.value = true;
                            },
                            text: 'SAVE CHANGES',
                          )
                        ],
                      )),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'SHIPPING INFORMATION',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Manage profile information for account security',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(color: Colors.grey.withOpacity(0.3)),
          Obx(
            () => isReadOnly2.value == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 280,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            childAspectRatio: 7,
                          ),
                          controller: _scrollController,
                          itemCount: _postCount,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < widget.userFirebase!.addressNumber) {
                              return CustomTextField(
                                initialText:
                                    widget.userFirebase!.addresses[index],
                                onChanged: (value) {
                                  addresses[index].value = value;
                                },
                                labelText: 'Address ${index + 1}',
                                textFieldWidth: TextFieldWidth.value,
                                showEdit: ShowEdit.yes,
                                isReadOnly: true,
                                width: 480,
                              );
                            } else {
                              return Container(); // Placeholder for empty item
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CTAButton(
                              onPressed: () {
                                isReadOnly2.value = false;
                              },
                              text: 'EDIT ADDRESSES',
                              buttonType: ButtonType.secondary,
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            CTAButton(
                              onPressed: () {
                                Get.toNamed('/add_addresses');
                              },
                              text: 'ADD NEW ADDRESS',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 280,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            childAspectRatio: 7,
                          ),
                          controller: _scrollController,
                          itemCount: _postCount,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < widget.userFirebase!.addressNumber) {
                              return CustomTextField(
                                initialText:
                                    widget.userFirebase!.addresses[index],
                                onChanged: (value) {
                                  addresses[index].value = value;
                                },
                                labelText: 'Address ${index + 1}',
                                textFieldWidth: TextFieldWidth.value,
                                showEdit: ShowEdit.yes,
                                isReadOnly: false,
                                width: 480,
                              );
                            } else {
                              return Container(); // Placeholder for empty item
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 80),
                        child: CTAButton(
                          onPressed: () {
                            Get.dialog(
                              ConfirmPopup(
                                title: 'APPLY CHANGES',
                                subtittle: 'Do you want to save changes?',
                                numberButton: 2,
                                button1: 'No',
                                onTap1: () {
                                  Get.back();
                                },
                                button2: 'Yes',
                                onTap2: () async {
                                  final AuthController _authController =
                                      Get.find();
                                  List<String> addresses1 = addresses
                                      .map((address) => address.value)
                                      .toList();

                                  UserFirebase userFirebase1 = UserFirebase(
                                    uid: widget.userFirebase!.uid,
                                    name: widget.userFirebase!.name,
                                    role: 'user',
                                    age: widget.userFirebase!.age,
                                    avatarImageLink:
                                        widget.userFirebase!.avatarImageLink,
                                    addresses: addresses1,
                                    phoneNumber:
                                        widget.userFirebase!.phoneNumber,
                                    emailAddress: _authController
                                        .authenticatedUser.value!.emailAddress,
                                    password: _authController
                                        .authenticatedUser.value!.password,
                                    addressNumber:
                                        widget.userFirebase!.addressNumber,
                                  );

                                  try {
                                    await userFirebase1.update();
                                
                                    Get.offAndToNamed('/user_profile');
                                  } catch (error) {
                                    print(
                                        'Failed to update user information: $error');
                                  }
                                },
                              ),
                            );
                            isReadOnly2.value = true;
                          },
                          text: 'SAVE CHANGES',
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

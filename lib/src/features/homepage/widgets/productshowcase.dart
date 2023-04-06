import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';
import '../../../common_widgets/cta_button.dart';

class ProductShowcase extends StatefulWidget {
  @override
  _ProductShowcaseState createState() => _ProductShowcaseState();
}

class _ProductShowcaseState extends State<ProductShowcase> {
  late Timer _timer;
  final int _numPages = 6;
  final PageController _pageController = PageController(initialPage: 0);
  bool _autoScrollEnabled = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.page == _numPages - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  void _stopAutoScroll() {
    _timer.cancel();
    setState(() {
      _autoScrollEnabled = false;
    });
  }

  void _resumeAutoScroll() {
    setState(() {
      _autoScrollEnabled = true;
    });
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 640,
      height: 480,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 400,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3580186_large.jpg?alt=media&token=c7e970e3-ace3-430a-8625-27c3cf67a940',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CTAButton(
                      onPressed: () => print('item 1'),
                      text: "BUY NOW",
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 400,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3734754_01a0b0cb-593a-4218-9c41-6ef22898569d_large.jpg?alt=media&token=eb948a3d-734a-4589-b5e5-e40f0ab7a18e',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CTAButton(
                      onPressed: () => print('item 1'),
                      text: "BUY NOW",
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 400,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3799430-2562025_large.jpg?alt=media&token=a190c7af-b6f9-44bc-918e-30b7742768eb',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CTAButton(
                      onPressed: () => print('item 1'),
                      text: "BUY NOW",
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 400,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F4110912-2920224_1e148604-73e4-43ac-a0e9-e9edf5d79408_large.jpg?alt=media&token=7757bddf-7769-4dbb-8820-9ac2a10f1b12',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CTAButton(
                      onPressed: () => print('item 1'),
                      text: "BUY NOW",
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 400,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2Fab6761610000e5ebfe9c808643258ecd6770aa7d.jpeg?alt=media&token=05671f4a-9082-4278-8bcb-7bf491c8d97f',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CTAButton(
                      onPressed: () => print('item 1'),
                      text: "BUY NOW",
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 400,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/ProductImages%2F3524405_large.jpg?alt=media&token=397a74ae-b4a8-4aa1-b215-aa642ded85c4',
                      width: 400,
                      height: 400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CTAButton(
                      onPressed: () => print('item 1'),
                      text: "BUY NOW",
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).canvasColor,
                  ),
                  child: IconButton(
                    enableFeedback: false,
                    icon: Icon(Icons.arrow_back_ios_new),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_autoScrollEnabled) {
                        _stopAutoScroll();
                      }
                      if (_pageController.page == 0) {
                        _pageController.animateToPage(_numPages - 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      } else {
                        _pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).canvasColor,
                  ),
                  child: IconButton(
                    enableFeedback: false,
                    color: Theme.of(context).primaryColor,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      if (_autoScrollEnabled) {
                        _stopAutoScroll();
                      }
                      if (_pageController.page == _numPages - 1) {
                        _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      } else {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
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

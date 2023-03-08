import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

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
      height: 320,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: [
                Image.network(
                  'https://picsum.photos/seed/101/200',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/102/200',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/103/200',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/104/200',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/105/200',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://picsum.photos/seed/106/200',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 128),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).canvasColor,
                    ),
                    child: IconButton(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 128),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).canvasColor,
                    ),
                    child: IconButton(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

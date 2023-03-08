import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

class HeroBanner extends StatefulWidget {
  @override
  _HeroBannerState createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  late Timer _timer;
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 6), (Timer timer) {
      if (_pageController.page == _numPages - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/HeroBanner%2FV23_Heritage_Liberty-01_RT_1400x.jpg?alt=media&token=95ea5cff-c6cd-4092-971f-9b0f1c65ca6f',
                width: 300,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/HeroBanner%2FCarbon-Stream-Sonos3_x1400.jpg?alt=media&token=171695b1-ec61-4fef-ac6e-5a01af71ef25',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/HeroBanner%2FVPMS-1-ESP_20_1400x.jpg?alt=media&token=240c9b4b-e55f-47b9-a6a2-46b904b935d6',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.95),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _numPages,
              axisDirection: Axis.horizontal,
              onDotClicked: (i) {
                _pageController.animateToPage(
                  i,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              effect: ExpandingDotsEffect(
                expansionFactor: 2,
                spacing: 8,
                radius: 16,
                dotWidth: 12,
                dotHeight: 12,
                dotColor: Colors.white,
                activeDotColor: Colors.black,
                paintStyle: PaintingStyle.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

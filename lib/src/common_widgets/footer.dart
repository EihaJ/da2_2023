import 'package:flutter/material.dart';

import '../constants/image_strings.dart';
import '../constants/colors.dart';

class WebsiteFooter extends StatefulWidget {
  @override
  _WebsiteFooterState createState() => _WebsiteFooterState();
}

class _WebsiteFooterState extends State<WebsiteFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 80, 0),
      height: 120,
      color: PrimaryColor1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Image.asset(logo_white),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // Navigate to Terms and Conditions page
                },
                child: Text(
                  'Privacy Policy',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(width: 48),
              InkWell(
                onTap: () {
                  // Navigate to Privacy Policy page
                },
                child: Text(
                  'Terms and Conditions',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(width: 48),
              InkWell(
                onTap: () {
                  // Navigate to Accessibility page
                },
                child: Text(
                  'Accessibility',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 88),
            child: Text(
              '© 2023 NUON',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                    //    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

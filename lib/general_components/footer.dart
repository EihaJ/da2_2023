import 'package:flutter/material.dart';

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
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
              aspectRatio: 1.5,
              child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/da2-2023.appspot.com/o/WebAssets%2FLogoWhite.png?alt=media&token=e659ad2b-57e8-421c-ba7c-f745c3f012be')),
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

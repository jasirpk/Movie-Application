import 'package:flutter/material.dart';
import 'package:movie_app/styles/stryle.dart';

class BackButton_Screen extends StatelessWidget {
  const BackButton_Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(left: 8, top: 8),
      decoration: BoxDecoration(
          color: Colours.scaffoldBgColor,
          borderRadius: BorderRadius.circular(8)),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
    );
  }
}

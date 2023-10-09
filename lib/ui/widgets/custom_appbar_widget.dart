import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;

  const CustomAppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: defaultMargin,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: greyColor,
              size: 25,
            ),
          ),
          SizedBox(
            width: defaultMargin,
          ),
          Text(
            title,
            style: txBold.copyWith(
              color: scdPurpleColor,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          // Icon(
          //   Icons.search_rounded,
          //   color: greyColor,
          //   size: 30,
          // ),
        ],
      ),
    );
  }
}

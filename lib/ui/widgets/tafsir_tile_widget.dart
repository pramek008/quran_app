import 'dart:math';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class TafsirTileWidget extends StatelessWidget {
  final String k;
  final String v;
  const TafsirTileWidget(this.k, this.v, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/logo_number_frame.png',
                    ),
                    Center(
                      child: Text(
                        k,
                        style: txMedium.copyWith(
                          color: blackColor,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ExpandableText(
                    v,
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 5,
                    linkColor: purpleColor,
                    textAlign: TextAlign.justify,
                    // style: TextStyle(height: 1.5),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
            ),
            child: Divider(
              color: greyColor.withOpacity(0.3),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

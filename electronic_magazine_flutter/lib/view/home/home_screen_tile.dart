import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen_tile_card.dart';

class HomeScreenTile extends StatelessWidget {
  final String titleData;
  final List<Widget> children;

  HomeScreenTile({
    @required this.titleData,
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.41 / 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16.0).copyWith(bottom: 8.0),
            child: Text(
              titleData,
              softWrap: false,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: GoogleFonts.benthamTextTheme(
                Theme.of(context).textTheme,
              ).headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 1.0,
            color: Colors.black,
            indent: 16.0,
            endIndent: 16.0,
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                right: 8.0,
                bottom: 8.0,
              ),
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

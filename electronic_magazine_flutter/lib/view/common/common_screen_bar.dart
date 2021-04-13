import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class CommonScreenBar extends StatelessWidget {
  final String titleData;
  final void Function() onBackIconButtonTap;

  CommonScreenBar({
    this.titleData,
    this.onBackIconButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.black,
      child: Container(
        width: double.maxFinite,
        height: 56.0 * 1.5,
        padding: EdgeInsets.all(16.0).copyWith(
          left: 0.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.0),
              child: onBackIconButtonTap == null
                  ? SizedBox()
                  : IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      iconSize: 24.0,
                      splashRadius: 24.0,
                      onPressed: onBackIconButtonTap,
                    ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                child: Text(
                  titleData,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: GoogleFonts.benthamTextTheme(
                    Theme.of(context).primaryTextTheme,
                  ).headline4.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 8.0),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                shape: CircleBorder(),
                child: Container(
                  width: 24.0,
                  height: 24.0,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 16.0,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

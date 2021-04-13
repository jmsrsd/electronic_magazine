import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_magazine_flutter/view/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class HomeScreenTileCard extends StatelessWidget {
  final String coverUrl;

  HomeScreenTileCard({
    @required this.coverUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      child: Material(
        color: Colors.black,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 5.0 / 3.0,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.0),
                      padding: EdgeInsets.all(8.0),
                      child: Material(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        child: AspectRatio(
                          aspectRatio: 1.0 / 1.41,
                          child: CachedNetworkImage(
                            imageUrl: coverUrl,
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.black,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lipsum.createSentence(),
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: GoogleFonts.benthamTextTheme(
                                Theme.of(context).primaryTextTheme,
                              ).headline6.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Divider(
                              height: 16.0,
                              thickness: 1.0,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                lipsum.createParagraph(numSentences: 5),
                                overflow: TextOverflow.fade,
                                style: Theme.of(
                                  context,
                                ).primaryTextTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Divider(
                              height: 16.0,
                              thickness: 1.0,
                              color: Colors.white,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Senin, 12 April 2021',
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: GoogleFonts.benthamTextTheme(
                                  Theme.of(context).primaryTextTheme,
                                ).bodyText1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return DetailScreen();
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

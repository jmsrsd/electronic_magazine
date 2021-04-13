import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronic_magazine_flutter/view/common/common_screen.dart';
import 'package:electronic_magazine_flutter/view/common/common_screen_bar.dart';
import 'package:electronic_magazine_flutter/view/content/content_screen.dart';
import 'package:electronic_magazine_flutter/view/home/home_screen_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

import 'detail_screen_card.dart';

class DetailScreen extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Column(
        children: [
          CommonScreenBar(
            titleData: 'Detil',
            onBackIconButtonTap: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24.0 * 8.0,
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0).copyWith(right: 0.0),
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Material(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                          clipBehavior: Clip.antiAlias,
                          child: AspectRatio(
                            aspectRatio: 1.0 / 1.41,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://creativereview.imgix.net/content/uploads/2020/12/good-weekend-mag.jpg?auto=compress,format&q=60&w=1200&h=',
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
                        RaisedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return ContentScreen();
                              }),
                            );
                          },
                          color: Colors.black,
                          icon: Icon(
                            Icons.menu_book,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Mulai membaca',
                            style: Theme.of(
                              context,
                            ).textTheme.button.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                          clipBehavior: Clip.antiAlias,
                        ),
                      ]
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.only(bottom: 8.0),
                              child: e,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            lipsum.createSentence(),
                            style: GoogleFonts.benthamTextTheme(
                              Theme.of(context).textTheme,
                            ).headline6.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Divider(
                            height: 16.0,
                            thickness: 1.0,
                            color: Colors.black,
                          ),
                          Text(
                            lipsum.createParagraph(numSentences: 5),
                            style: Theme.of(
                              context,
                            ).textTheme.subtitle1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                          ),
                          Divider(
                            height: 16.0,
                            thickness: 1.0,
                            color: Colors.black,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Senin, 12 April 2021',
                              style: GoogleFonts.benthamTextTheme(
                                Theme.of(context).textTheme,
                              ).bodyText1.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
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
          Divider(
            height: 0.0,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
            color: Colors.black,
          ),
          Container(
            alignment: Alignment.center,
            height: 24.0 * 9.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Baca juga',
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
                  indent: 16.0,
                  endIndent: 16.0,
                  color: Colors.black,
                ),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      left: 16.0,
                      top: 16.0,
                      right: 8.0,
                      bottom: 16.0,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: [
                      DetailScreenCard(
                        coverUrl:
                            'https://creativereview.imgix.net/content/uploads/2020/12/good-weekend-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                      ),
                      DetailScreenCard(
                        coverUrl:
                            'https://creativereview.imgix.net/content/uploads/2020/09/January-cover-4.jpg?auto=compress,format&q=60&w=1370&h=',
                      ),
                      DetailScreenCard(
                        coverUrl:
                            'https://creativereview.imgix.net/content/uploads/2020/12/british-vogue-activism-now.jpg?auto=compress,format&q=60&w=1200&h=',
                      ),
                      DetailScreenCard(
                        coverUrl:
                            'https://creativereview.imgix.net/content/uploads/2020/12/ny-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                      ),
                      DetailScreenCard(
                        coverUrl:
                            'https://creativereview.imgix.net/content/uploads/2020/05/23-May-Cover-1.jpg?auto=compress,format&q=60&w=1200&h=',
                      ),
                      DetailScreenCard(
                        coverUrl:
                            'https://i.guim.co.uk/img/media/3cffe7a02c77fa2f50fabdc540e0009fd44dc00b/0_0_3555_4547/master/3555.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=b0442be03377257cfd695da51e98e48c',
                      ),
                      DetailScreenCard(
                        coverUrl:
                            'https://i.guim.co.uk/img/media/b72182b585edf3c4141ffdd2ee7545de384a0c07/0_0_2700_3263/master/2700.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=0d9ab403f27fb290a9a3a03a7e62cd6a',
                      ),
                    ],
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

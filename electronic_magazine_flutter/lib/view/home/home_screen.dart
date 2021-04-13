import 'dart:async';

import 'package:electronic_magazine_flutter/view/common/common_screen.dart';
import 'package:electronic_magazine_flutter/view/common/common_screen_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen_tile.dart';
import 'home_screen_tile_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      child: Column(
        children: [
          CommonScreenBar(
            titleData: 'Beranda',
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                Timer.run(() {
                  setState(() {});
                });
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 16.0 + 8.0,
                ),
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    HomeScreenTile(
                      titleData: 'Terbaru',
                      children: [
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/good-weekend-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/09/January-cover-4.jpg?auto=compress,format&q=60&w=1370&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/british-vogue-activism-now.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/ny-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/05/23-May-Cover-1.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://i.guim.co.uk/img/media/3cffe7a02c77fa2f50fabdc540e0009fd44dc00b/0_0_3555_4547/master/3555.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=b0442be03377257cfd695da51e98e48c',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://i.guim.co.uk/img/media/b72182b585edf3c4141ffdd2ee7545de384a0c07/0_0_2700_3263/master/2700.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=0d9ab403f27fb290a9a3a03a7e62cd6a',
                        ),
                      ],
                    ),
                    HomeScreenTile(
                      titleData: 'Lifestyle',
                      children: [
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/good-weekend-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/09/January-cover-4.jpg?auto=compress,format&q=60&w=1370&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/british-vogue-activism-now.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/ny-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/05/23-May-Cover-1.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://i.guim.co.uk/img/media/3cffe7a02c77fa2f50fabdc540e0009fd44dc00b/0_0_3555_4547/master/3555.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=b0442be03377257cfd695da51e98e48c',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://i.guim.co.uk/img/media/b72182b585edf3c4141ffdd2ee7545de384a0c07/0_0_2700_3263/master/2700.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=0d9ab403f27fb290a9a3a03a7e62cd6a',
                        ),
                      ],
                    ),
                    HomeScreenTile(
                      titleData: 'Covid-19',
                      children: [
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/good-weekend-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/09/January-cover-4.jpg?auto=compress,format&q=60&w=1370&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/british-vogue-activism-now.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/12/ny-mag.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://creativereview.imgix.net/content/uploads/2020/05/23-May-Cover-1.jpg?auto=compress,format&q=60&w=1200&h=',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://i.guim.co.uk/img/media/3cffe7a02c77fa2f50fabdc540e0009fd44dc00b/0_0_3555_4547/master/3555.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=b0442be03377257cfd695da51e98e48c',
                        ),
                        HomeScreenTileCard(
                          coverUrl:
                              'https://i.guim.co.uk/img/media/b72182b585edf3c4141ffdd2ee7545de384a0c07/0_0_2700_3263/master/2700.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=0d9ab403f27fb290a9a3a03a7e62cd6a',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

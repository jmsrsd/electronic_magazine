import 'package:electronic_magazine_flutter/view/common/common_screen.dart';
import 'package:electronic_magazine_flutter/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';

class SplashScreen extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await MoveToBackground.moveTaskToBack();

        return false;
      },
      child: CommonScreen(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/splash_icon.png',
                  width: 128.0,
                  height: 128.0,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16.0,
                  ),
                  width: 128.0,
                  child: LinearProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

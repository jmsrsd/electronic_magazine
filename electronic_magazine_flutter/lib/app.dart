import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'view/content/content_screen.dart';
import 'view/detail/detail_screen.dart';
import 'view/home/home_screen.dart';
import 'view/splash/splash_screen.dart';

class App extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<App> {
  ThemeData get themeData {
    final result = ThemeData.light();
    final textThemeBuilder = GoogleFonts.rubikTextTheme;

    return result.copyWith(
      textTheme: textThemeBuilder(result.textTheme),
      primaryTextTheme: textThemeBuilder(result.primaryTextTheme),
      accentTextTheme: textThemeBuilder(result.accentTextTheme),
      highlightColor: result.accentColor.withOpacity(0.12),
      splashColor: result.accentColor.withOpacity(0.12),
      buttonTheme: result.buttonTheme.copyWith(
        highlightColor: result.accentColor.withOpacity(0.12),
        splashColor: result.accentColor.withOpacity(0.12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SplashScreen(),
    );
  }
}

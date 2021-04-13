import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonScreen extends StatefulWidget {
  final Widget child;

  CommonScreen({
    @required this.child,
  });

  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Column(
        children: [
          Container(
            height: 24.0,
            color: Colors.black,
          ),
          Expanded(
            child: Scaffold(
              body: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

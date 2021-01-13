import 'package:flutter/material.dart';

import 'package:web_factory/screens/home.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return HomeScreen(scaffoldKey: _scaffoldKey);
        },
      ),
    );
  }
}

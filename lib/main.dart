import 'package:flutter/material.dart';
import 'theme/theme.dart';
import 'widgets/common/launch_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Factory',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LaunchNavigator(),
    );
  }
}

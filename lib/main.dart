import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/services/hive_service.dart';
import 'theme/theme.dart';
import 'widgets/common/launch_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = HiveService();
  await hiveService.configure();
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

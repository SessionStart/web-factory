import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/blocs/launch_bloc.dart';
import 'package:flutter_firebase_site/blocs/auth_bloc.dart';
import 'package:flutter_firebase_site/blocs/navigation_bloc.dart';
import 'package:flutter_firebase_site/screens/auth/auth.dart';
import 'package:flutter_firebase_site/screens/common/in_creation_screen.dart';
import 'package:flutter_firebase_site/screens/home/home.dart';
import 'package:flutter_firebase_site/utils/enums.dart';
import 'package:provider/provider.dart';

class LaunchNavigator extends StatelessWidget {
  const LaunchNavigator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launchBloc = Provider.of<LaunchBloc>(context);

    switch (launchBloc.pagesTree) {
      case LaunchPages.Home:
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<NavigationBloc>(
              create: (_) => NavigationBloc(),
            ),
          ],
          builder: (context, w) => Home(),
        );
        break;
      case LaunchPages.Auth:
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthBloc>(
              create: (_) => AuthBloc(),
            ),
          ],
          builder: (context, _) => AuthScreen(),
        );
        break;
      case LaunchPages.Onboarding:
        return InCreationScreen();
        break;
      default:
        return InCreationScreen();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:web_factory/blocs/launch_bloc.dart';
import 'package:web_factory/blocs/auth_bloc.dart';
import 'package:web_factory/blocs/navigation_bloc.dart';
import 'package:web_factory/screens/auth/auth.dart';
import 'package:web_factory/screens/common/in_creation_screen.dart';
import 'package:web_factory/screens/home/home.dart';
import 'package:web_factory/utils/enums.dart';
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

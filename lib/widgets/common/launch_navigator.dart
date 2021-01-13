import 'package:flutter/material.dart';
import 'package:web_factory/blocs/launch_bloc.dart';
import 'package:web_factory/blocs/auth_bloc.dart';
import 'package:web_factory/blocs/machines_bloc.dart';
import 'package:web_factory/blocs/navigation_bloc.dart';
import 'package:web_factory/data/repositories/machines_repository/repository.dart';
import 'package:web_factory/data/repositories/user_repository/abstract_user_repository.dart';
import 'package:web_factory/data/repositories/user_repository/hive_user_repository/hive_user_repository.dart';
import 'package:web_factory/screens/auth/auth.dart';
import 'package:web_factory/screens/common/in_creation_screen.dart';
import 'package:web_factory/screens/home/home.dart';
import 'package:web_factory/utils/enums.dart';
import 'package:provider/provider.dart';

class LaunchNavigator extends StatefulWidget {
  const LaunchNavigator({
    Key key,
    @required this.userRepository,
  }) : super(key: key);

  final AbstractUserRepository userRepository;

  @override
  _LaunchNavigatorState createState() => _LaunchNavigatorState();
}

class _LaunchNavigatorState extends State<LaunchNavigator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final launchBloc = Provider.of<LaunchBloc>(context);

    switch (launchBloc.pagesTree) {
      case LaunchPages.Home:
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<MachinesBloc>(
              create: (_) => MachinesBloc(
                machinesRepository: MockMachinesRepository(),
              )..init(context),
            ),
          ],
          builder: (context, w) => Home(),
        );
        break;
      case LaunchPages.Auth:
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthBloc>(
              create: (_) => AuthBloc(
                userRepository: widget.userRepository,
              ),
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

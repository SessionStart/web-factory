import 'package:flutter/material.dart';
import 'package:web_factory/services/hive_service.dart';
import 'package:provider/provider.dart';
import 'blocs/launch_bloc.dart';
import 'blocs/repository_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'theme/custom_themes/dark_app_theme.dart';
import 'theme/themes/light_theme.dart';
import 'widgets/common/launch_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = HiveService();
  await hiveService.init();
  runApp(
    MultiProvider(
      providers: [
        //TODO: во всех местах использовать
        //репозиторий из бока репозиториев
        ChangeNotifierProvider<RepositoryBloc>(
          create: (_) => RepositoryBloc(
            userRepository: hiveService.userRepository,
          ),
        ),
        ChangeNotifierProvider<ThemeBloc>(
          create: (_) => ThemeBloc(
            customTheme: DarkAppTheme(),
            themeData: lightTheme,
          ),
        ),
      ],
      builder: (ctx, _) {
        return MyApp(hiveService: hiveService);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  final HiveService hiveService;

  const MyApp({Key key, this.hiveService}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LaunchBloc>(
          create: (_) => LaunchBloc(
            userRepository: hiveService.userRepository,
          ),
        ),
      ],
      builder: (ctx, _) {
        final themeData = Provider.of<ThemeBloc>(ctx).themeData;
        _initializeBlocs(ctx);
        return MaterialApp(
          title: 'Web Factory',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: LaunchNavigator(
            userRepository: hiveService.userRepository,
          ),
        );
      },
    );
  }

  Future<void> _initializeBlocs(BuildContext context) async {
    Provider.of<LaunchBloc>(context).init(context);
  }
}

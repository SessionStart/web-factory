import 'package:flutter/material.dart';
import 'package:web_factory/services/hive_service.dart';
import 'package:provider/provider.dart';
import 'blocs/launch_bloc.dart';
import 'blocs/repository_bloc.dart';
import 'theme/theme.dart';
import 'widgets/common/launch_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = HiveService();
  await hiveService.init();
  runApp(
    ChangeNotifierProvider<RepositoryBloc>(
      create: (_) => RepositoryBloc(
        userRepository: hiveService.userRepository,
      ),
      child: MyApp(hiveService: hiveService),
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
        _initializeBlocs(ctx);
        return MaterialApp(
          title: 'Web Factory',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: LaunchNavigator(),
        );
      },
    );
  }

  Future<void> _initializeBlocs(BuildContext context) async {
    Provider.of<LaunchBloc>(context).init(context);
  }
}

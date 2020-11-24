import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/widgets/common/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_site/screens/home.dart';
import 'package:flutter_firebase_site/widgets/nav_bar.dart';

import '../../blocs/navigation_bloc.dart';
import '../../screens/about.dart';
import '../../screens/contacts.dart';
import '../../screens/prices.dart';

const _titles = [
  'Home',
  'About',
  'Prices',
  'Contacts',
];

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  Widget _buildScreen(
    int index,
    GlobalKey scaffoldKey,
  ) {
    switch (index) {
      case 0:
        return HomeScreen(scaffoldKey: scaffoldKey);
        break;
      case 1:
        return About(scaffoldKey: scaffoldKey);
        break;
      case 2:
        return Prices(scaffoldKey: scaffoldKey);
        break;
      default:
        return Contacts(scaffoldKey: scaffoldKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navigationBloc = Provider.of<NavigationBloc>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return _buildScreen(
            navigationBloc.selectedIndex,
            _scaffoldKey,
          );
        },
      ),
    );
  }
}

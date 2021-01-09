import 'package:flutter/material.dart';
import 'package:web_factory/utils/responsive/responsive_helper.dart';
import 'package:web_factory/widgets/responsive/responsive_view.dart';

import 'home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
    @required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      largeScreen: _buildLargeView(context),
      mediumScreen: _buildLargeView(context),
      smallScreen: _buildLargeView(context),
    );
  }

  Widget _buildLargeView(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.67,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleHome(),
                MessagesCard(),
              ],
            ),
          ),
          Container(
            width: size.width * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 1,
              itemBuilder: (BuildContext context, int i) {
                return MachineCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallScreenView(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          "S",
          style: theme.textTheme.headline1.copyWith(
            fontSize: ResponsiveHelper.respWidthSize(context, 0.13),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_firebase_site/theme/app_theme.dart';
import 'package:flutter_firebase_site/utils/responsive/responsive_helper.dart';
import 'package:flutter_firebase_site/widgets/common/image/custom_image.dart';
import 'package:flutter_firebase_site/widgets/responsive/responsive_view.dart';

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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 3 * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width / 3 * 2 - 30,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: theme.cardColor,
                    boxShadow: AppTheme.boxShadow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomNetworkImage(
                          width: 200,
                          height: 150,
                          url:
                              'https://ritm-magazine.ru/sites/default/files/stc_f2501.jpg',
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width / 3 * 1,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  height: 100,
                  margin: i == 0
                      ? EdgeInsets.all(5.0).copyWith(top: 0)
                      : EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: theme.cardColor,
                    boxShadow: AppTheme.boxShadow,
                  ),
                );
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

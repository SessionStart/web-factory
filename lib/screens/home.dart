import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/theme/custom_themes/dark_app_theme.dart';
import 'package:web_factory/utils/responsive/responsive_helper.dart';
import 'package:web_factory/widgets/common/custom_button.dart';
import 'package:web_factory/widgets/common/image/custom_image.dart';
import 'package:web_factory/widgets/responsive/responsive_view.dart';

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
    final customTheme = Provider.of<ThemeBloc>(context).customTheme;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 247 / 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 247 / 360, //* 2 - 30,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: theme.cardColor,
                    boxShadow: customTheme.boxShadow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomNetworkImage(
                          width: size.width * 433 / 1440,
                          height: size.height * 303 / 1024,
                          url:
                              'https://ritm-magazine.ru/sites/default/files/stc_f2501.jpg',
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 433 / 1440,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: theme.accentColor,
                                boxShadow: customTheme.boxShadow,
                              ),
                              child: Text(
                                'Название/номер',
                                style: theme.textTheme.headline3,
                              ),
                            ),
                            Container(
                              width: size.width * 433 / 1440,
                              //height: size.height * 208 / 1440,
                              padding: EdgeInsets.only(top: size.height * 208 / 1440),
                              //alignment: Alignment.bottomCenter,
                              child: CustomButton(
                                color: theme.accentColor,
                                height: size.height * 95 / 1024,
                                child: Text(
                                  'Остановить',
                                  style: theme.textTheme.button,
                                  ),
                                onPressed: () => print('stop button pressed'),
                              )
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width / 4 * 3, //* 2 - 30,
                  height: size.height * 719 / 1440,
                  margin: EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: theme.cardColor,
                    boxShadow: customTheme.boxShadow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: size.width * 21 / 160),
                              child: Text('Название'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 113 / 360,
            padding: EdgeInsets.only(left: size.width * 5 / 288),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 4,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  //height: size.height * 451 / 1440,
                  padding: EdgeInsets.all(5.0),
                  margin: i == 0
                      ? EdgeInsets.all(5.0).copyWith(top: 0)
                      : EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: theme.cardColor,
                    boxShadow: customTheme.boxShadow,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomNetworkImage(
                          width: size.width * 61 / 480,
                          height: size.height / 8,
                          url:
                              'https://ritm-magazine.ru/sites/default/files/stc_f2501.jpg',
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text('Название')
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * 137 / 480,
                        padding: EdgeInsets.all(5.0),
                        child: CustomButton(
                          height: size.height * 23 / 256,
                          color: theme.accentColor,
                          child: Text(
                            'Остановить',
                            style: theme.textTheme.headline4,
                            ),
                          onPressed: () => print('stop button pressed'),
                        )
                      ),
                    ],
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

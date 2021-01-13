
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/widgets/common/custom_button.dart';
import 'package:web_factory/widgets/common/image/custom_image.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<ThemeBloc>(context).customTheme;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
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
                  child:
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Название/номер',
                      style: theme.textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/widgets/common/custom_button.dart';
import 'package:web_factory/widgets/common/image/custom_image.dart';

class MachineCard extends StatelessWidget {
  const MachineCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<ThemeBloc>(context).customTheme;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10.0),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CustomNetworkImage(
                    width: size.width * 0.1,
                    height: 100,
                    url:
                        'https://ritm-magazine.ru/sites/default/files/stc_f2501.jpg',
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Название',
                          style: theme.textTheme.headline3,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: theme.accentColor,
                        boxShadow: customTheme.listViewBoxShadow,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CustomButton(
            height: 40,
            width: double.infinity,
            color: theme.accentColor,
            child: Text(
              'Остановить',
              style: theme.textTheme.headline4,
            ),
            onPressed: () => print('stop button pressed'),
          ),
        ],
      ),
    );
  }
}

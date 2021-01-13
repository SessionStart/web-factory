import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/models/machine.dart';
import 'package:web_factory/theme/themes/mutual_theme.dart';
import 'package:web_factory/widgets/common/custom_button.dart';
import 'package:web_factory/widgets/common/image/custom_image.dart';

class MachineCard extends StatelessWidget {
  const MachineCard({
    Key key,
    @required this.machie,
  }) : super(key: key);

  final Machine machie;

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
        boxShadow: machie?.params?.isRunning
            ? customTheme.boxShadow
            : listViewBoxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              CustomNetworkImage(
                width: size.width * 0.3,
                height: 110,
                url: machie?.photoUrl,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5).copyWith(bottom: 0.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.label,
                          size: 18,
                          color: machie?.params?.isRunning
                              ? theme.primaryColor
                              : alertColor,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          machie?.serialNumber,
                          style: theme.textTheme.headline3.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.label,
                          size: 18,
                          color: machie?.params?.isRunning
                              ? theme.primaryColor
                              : alertColor,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          machie?.type,
                          style: theme.textTheme.headline3.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5).copyWith(bottom: 0.0),
                    child: Row(
                      children: [
                        Icon(
                          machie?.params?.isRunning
                              ? Icons.check
                              : Icons.warning,
                          size: 18,
                          color: machie?.params?.isRunning
                              ? theme.primaryColor
                              : alertColor,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          machie?.params?.isRunning
                              ? 'Работает'
                              : 'Возникла ошибка',
                          style: theme.textTheme.headline3.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (machie?.params?.isRunning)
            CustomButton(
              height: 30,
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/machines_bloc.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/models/machine.dart';
import 'package:web_factory/theme/themes/mutual_theme.dart';
import 'package:web_factory/widgets/common/custom_button.dart';
import 'package:web_factory/widgets/common/image/custom_image.dart';

class TitleHome extends StatelessWidget {
  const TitleHome({
    Key key,
    @required this.machine,
  }) : super(key: key);

  final Machine machine;

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<ThemeBloc>(context).customTheme;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final bloc = Provider.of<MachinesBloc>(context);
    if (machine == null) {
      return Container(
        height: 250,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: theme.cardColor,
          boxShadow: customTheme.boxShadow,
        ),
      );
    }
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              width: size.width * 0.3,
              height: 200,
              url: machine?.photoUrl,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.33,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${machine.serialNumber}',
                    style: theme.textTheme.headline3.copyWith(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.label,
                        color: theme.accentColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '${machine.type}',
                        style: theme.textTheme.headline3.copyWith(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.ac_unit,
                            color: theme.accentColor,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '${machine.params.temperature}',
                            style: theme.textTheme.headline3.copyWith(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: theme.accentColor,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            _getMachineTime(bloc),
                            style: theme.textTheme.headline3.copyWith(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.warning,
                        color: machine.params.isRunning
                            ? theme.accentColor
                            : alertColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '${machine.params.isRunning ? 'Запущен' : 'Возникла ошибка'}',
                        style: theme.textTheme.headline3.copyWith(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  CustomButton(
                    color: theme.accentColor,
                    width: 150,
                    height: 40,
                    child: Text(
                      'Остановить',
                      style: theme.textTheme.button.copyWith(fontSize: 18),
                    ),
                    onPressed: () => print('stop button pressed'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMachineTime(MachinesBloc bloc){
    if(machine.params.isRunning){
      final time = (machine.params.machineTime + bloc.machineTime);
      return
        '${time ~/ 60} : ${time % 60}';
    }
      return '${machine.params.machineTime ~/ 60} : ${machine.params.machineTime % 60}';

  }
}

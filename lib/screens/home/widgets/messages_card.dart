import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/models/machine.dart';

class MessagesCard extends StatelessWidget {
  const MessagesCard({
    Key key,
    @required this.machine,
  }) : super(key: key);

  final Machine machine;

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<ThemeBloc>(context).customTheme;
    final theme = Theme.of(context);
    if(machine == null){
      return Container(
          height: 200,
          margin: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: theme.cardColor,
            boxShadow: customTheme.boxShadow,
          ),
      );
    }
    return Container(
      height: 200,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Text(
                    'Все сообщения',
                    style: theme.textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: machine.warnings.map((e) => Text(e)).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

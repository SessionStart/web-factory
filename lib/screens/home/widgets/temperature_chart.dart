import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/theme/custom_themes/abstract_custom_theme.dart';
import 'package:web_factory/widgets/cahrts/temperature_chart.dart';


class TemperatureChartCard extends StatelessWidget {
  const TemperatureChartCard({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<ThemeBloc>(context).customTheme;
    final theme = Theme.of(context);
    return Container(
      height: 400,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: theme.cardColor,
        boxShadow: customTheme.boxShadow,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: TemperatureChart.withSampleData(context),
      ),
    );
  }
}
/// Timeseries chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/machines_bloc.dart';

class TemperatureChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TemperatureChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TemperatureChart.withSampleData(BuildContext context) {
    final machinesBloc = Provider.of<MachinesBloc>(context);
    return new TemperatureChart(
      _createSampleData(machinesBloc, context),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(MachinesBloc machinesBloc, BuildContext context) {
    final theme = Theme.of(context);
    final data =      machinesBloc.machines.map((e) =>
        TimeSeriesSales(new DateTime.now().add(Duration(days: e.id)), e.params.temperature),
    ).toList();

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(theme.accentColor),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
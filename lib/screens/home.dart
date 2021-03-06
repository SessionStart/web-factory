import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_factory/blocs/machines_bloc.dart';
import 'package:web_factory/blocs/theme_bloc.dart';
import 'package:web_factory/widgets/cahrts/temperature_chart.dart';

import 'home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
    @required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MachinesBloc>(context);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width * 0.67,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleHome(
                        machine: bloc.selectedMachine,
                      ),
                      MessagesCard(
                        machine: bloc.selectedMachine,
                      ),
                      TemperatureChartCard(),
                      SizedBox(height: 10),
                      TemperatureChartCard(),
                      SizedBox(height: 10),
                      TemperatureChartCard(),
                      SizedBox(height: 140),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: size.width * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: bloc.machines.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: (){
                    bloc.selectedMachineIndex = i;
                  },
                  child: Padding(
                    padding: i != 0
                        ? EdgeInsets.all(10.0)
                        : EdgeInsets.all(10.0).copyWith(top: 0.0),
                    child: MachineCard(
                      machie: bloc.machines[i],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

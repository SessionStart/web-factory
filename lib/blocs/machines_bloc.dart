import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:web_factory/data/repositories/machines_repository/repository.dart';
import 'package:web_factory/models/interfaces/initializeble_interface.dart';
import 'package:web_factory/models/machine.dart';

class MachinesBloc extends ChangeNotifier implements Initializeble {
  MachinesBloc({
    @required this.machinesRepository,
  });

  Timer _timer;
  int _start = 60;
  static const _oneSec = const Duration(seconds: 1);

  List<Machine> machines = [];
  final AbstractMachinesRepository machinesRepository;

  Future<void> loadMachines() async {
    machines = await machinesRepository.loadFromFile();
    notifyListeners();
  }

  updateMachine(Machine machine){
    final i = machines.indexWhere((m) => m.id == machine.id);
    machines[i] = machine;
    notifyListeners();
  }

  crashMachineByIndex(int i){
    machines[i] = machines[i].copyWith(params: machines[i].params.copyWith(isRunning: false));
    notifyListeners();
  }

  crashMachine(Machine machine){
    final i = machines.indexWhere((m) => m.id == machine.id);
    machines[i] = machines[i].copyWith(params: machines[i].params.copyWith(isRunning: false));
    notifyListeners();
  }

  runMachine(Machine machine){
    final i = machines.indexWhere((m) => m.id == machine.id);
    machines[i] = machines[i].copyWith(params: machines[i].params.copyWith(isRunning: true));
    notifyListeners();
  }

  @override
  Future<void> init(BuildContext context) async {
    await loadMachines();
    startTimer();
  }

  void startTimer() {
    _timer = new Timer.periodic(
      _oneSec,
          (Timer timer) {
        if (_start == 0) {
          crashMachineByIndex(0);
            timer.cancel();
        } else {
            _start--;
        }
      },
    );
  }
}

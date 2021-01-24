import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:web_factory/data/repositories/machines_repository/repository.dart';
import 'package:web_factory/models/interfaces/initializeble_interface.dart';
import 'package:web_factory/models/machine.dart';

class MachinesBloc extends ChangeNotifier implements Initializeble {
  MachinesBloc({
    @required this.machinesRepository,
  });

  Timer _timer;
  Timer _machineTimer;
  int _start = 60;
  int _machineStart = 100000;
  static const _oneSec = const Duration(seconds: 1);

  int _selectedMachineIndex = 0;
  int _machineTime = 0;

  List<Machine> machines = [];
  final AbstractMachinesRepository machinesRepository;

  Machine get selectedMachine =>
      machines.isNotEmpty ? machines[_selectedMachineIndex] : null;

  int get selectedMachineIndex => _selectedMachineIndex;
  int get machineTime => _machineTime;

  set selectedMachineIndex(int val) {
    _selectedMachineIndex = val;
    notifyListeners();
  }

  Future<void> loadMachines() async {
    machines = await machinesRepository.loadFromFile();
    notifyListeners();
  }

  updateMachine(Machine machine) {
    final i = machines.indexWhere((m) => m.id == machine.id);
    machines[i] = machine;
    notifyListeners();
  }

  crashMachineByIndex(int i) {
    machines[i] = machines[i]
        .copyWith(params: machines[i].params.copyWith(isRunning: false));
    notifyListeners();
  }

  crashMachine(Machine machine) {
    final i = machines.indexWhere((m) => m.id == machine.id);
    machines[i] = machines[i]
        .copyWith(params: machines[i].params.copyWith(isRunning: false));
    notifyListeners();
  }

  runMachine(Machine machine) {
    final i = machines.indexWhere((m) => m.id == machine.id);
    machines[i] = machines[i]
        .copyWith(params: machines[i].params.copyWith(isRunning: true));
    notifyListeners();
  }

  @override
  Future<void> init(BuildContext context) async {
    await loadMachines();
    startTimer();
    startMachineTimer();
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

  void startMachineTimer() {
    _machineTimer = new Timer.periodic(
      _oneSec,
      (Timer timer) {
        _machineTime += 1;
        machines.forEach((e) {
          updateMachine(e.copyWith(
              params: e.params.copyWith(
                  temperature: e.params.temperature + _getRandomDelta(e.params.temperature),
              )
          ));
        });
        notifyListeners();
        if (_machineStart == 0) {
          timer.cancel();
        } else {
          _machineStart--;
        }
      },
    );
  }

  int _getRandomDelta(int temperature){
    final rnd = Random();
    final num = rnd.nextInt(10);
    return (temperature >= 60 && temperature < 100) ? - num : (temperature >= 30 && temperature < 60) ? num : (temperature >= 100) ? - temperature ~/2 : temperature ~/2 ;
  }
}

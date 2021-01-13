import 'package:web_factory/data/repositories/machines_repository/mock_machines_repository/abstract_machines_repository.dart';
import 'package:web_factory/data/repositories/user_repository/abstract_user_repository.dart';
import 'package:web_factory/models/machine.dart';
import 'dart:convert';

import 'package:flutter/services.dart';


class MockMachinesRepository extends AbstractMachinesRepository{
   Future<List<Machine>> loadFromFile() async {
    final machines = <Machine>[];
    final jsonString = await _loadAssets(
        'lib/data/repositories/machines_repository/mock_machines_repository/machines_data.json');
    final jsonResponse = json.decode(jsonString) as List;
    jsonResponse.forEach((m) {
      machines.add(Machine.fromMap(m));
    });
    return machines;
  }

   Future<String> _loadAssets(String path) async {
    return rootBundle.loadString(path);
  }
}
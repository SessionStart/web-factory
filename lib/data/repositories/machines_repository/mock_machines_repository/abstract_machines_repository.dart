import 'package:web_factory/models/machine.dart';

abstract class AbstractMachinesRepository{
  Future<List<Machine>> loadFromFile();
}
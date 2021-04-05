import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project/model/task.dart';

Future<String> _loadTaskAsset() async {
  return await rootBundle.loadString('assets/task.json');
}

Future loadTask() async {
  String jsonString = await _loadTaskAsset();
  final jsonResponse = json.decode(jsonString);
  Task task = new Task.fromJson(jsonResponse);
  print(task.taskScores);
}


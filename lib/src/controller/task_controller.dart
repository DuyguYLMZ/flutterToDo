import 'dart:async';

import 'package:project/src/model/task.dart';

final _taskStateController = StreamController<List<Task>>();
StreamSink<List<Task>> get _inTaskSink => _taskStateController.sink;
Stream<List<Task>> get tasks => _taskStateController.stream;
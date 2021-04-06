import 'dart:async';

import 'package:project/src/bloc/task_event.dart';
import 'package:project/src/model/task.dart';

class TaskBloc {
  List<Task> _tasks = [];

  final _taskStateController = StreamController<List<Task>>();
  StreamSink<List<Task>> get _inTaskSink => _taskStateController.sink;

  Stream<List<Task>> get tasks => _taskStateController.stream;

  final _taskEventController = StreamController<TaskEvent>();
  Sink<TaskEvent> get taskEventSink => _taskEventController.sink;

  TaskBloc() {
    _taskEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TaskEvent event) {
    if (event is AddTaskEvent) {
      _tasks.add(event.task);
    } else if (event is DeleteTaskEvent) {
      _tasks.removeAt(event.index);
    } else if (event is ToggleTaskEvent) {
      _tasks.asMap().forEach((index, task) {
        if (index == event.index) {
          task.isCompleted = !task.isCompleted;
        }
      });
    }

    _inTaskSink.add(_tasks);
  }

  void dispatch(TaskEvent event) {
    taskEventSink.add(event);
  }

  void dispose() {
    _taskEventController.close();
    _taskStateController.close();
  }
}
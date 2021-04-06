
import 'package:project/src/model/task.dart';

abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  Task task;
  AddTaskEvent({this.task});
}

class DeleteTaskEvent extends TaskEvent {
  int index;
  DeleteTaskEvent({this.index});
}

class ToggleTaskEvent extends TaskEvent {
  int index;
  ToggleTaskEvent({this.index});
}
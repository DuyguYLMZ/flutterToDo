
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/bloc/task_bloc.dart';
import 'package:project/src/bloc/task_event.dart';
import 'package:project/src/model/task.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _bloc = TaskBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _showDialog(context, _bloc);
          }),
      body: StreamBuilder(
        stream: _bloc.tasks,
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: Text('Add new task'),
            );
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onDoubleTap: () =>
                    _bloc.dispatch(ToggleTaskEvent(index: index)),
                onLongPress: () =>
                    _bloc.dispatch(DeleteTaskEvent(index: index)),
                child: ListTile(
                    title: Text(
                      snapshot.data[index].taskName,
                      style: TextStyle(
                          decoration: snapshot.data[index].isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    )),
              );
            },
          );
        },
      ),
    );
  }
}

_showDialog(BuildContext context, TaskBloc bloc) async {
  TextEditingController _controller = TextEditingController();
  await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'What to do?', hintText: 'eg. Go to mall'),
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            FlatButton(
                child: const Text('SAVE'),
                onPressed: () {
                  if (_controller.text != '') {
                    bloc.dispatch(
                      AddTaskEvent(
                        task: Task(taskName:  '${_controller.text.toString()}'),
                      ),
                    );
                  }
                  Navigator.pop(context);
                })
          ],
        );
      });
}
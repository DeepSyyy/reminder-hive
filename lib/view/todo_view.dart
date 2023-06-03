import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool _isDone = false;

  List<Map<String, dynamic>> _userTask = [];
  @override
  void initState() {
    super.initState();
    _getUserTask();
  }

  final _user_task = Hive.box('user_task');

  void _getUserTask() {
    final task = _user_task.keys.map((key) {
      final userTask = _user_task.get(key);
      return {
        "key": key,
        "title": userTask['title'],
        "description": userTask['description'],
        "isDone": userTask['isDone']
      };
    }).toList();

    setState(() {
      _userTask = task.reversed.toList();
    });
  }

  Future<void> _addTask(Map<String, dynamic> newTask) async {
    await _user_task.add(newTask);
    _getUserTask();
    print("amount of task: ${_user_task.length}");
    print(_user_task.values);
  }

  Future<void> _editTask(int itemKey, Map<String, dynamic> newTask) async {
    await _user_task.put(itemKey, newTask);
    setState(() {
      _isDone = !_isDone;
    });

    _getUserTask();
  }

  void _showForm(BuildContext context, int? itemKey) {
    if (itemKey != null) {
      final task = _user_task.get(itemKey);
      _titleController.text = task['title'];
      _descriptionController.text = task['description'];
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: Column(
            children: [
              Text("Add Reminder"),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (itemKey != null) {
                    await _editTask(itemKey, {
                      "title": _titleController.text,
                      "description": _descriptionController.text,
                    });
                  } else {
                    await _addTask({
                      "title": _titleController.text,
                      "description": _descriptionController.text,
                      "isDone": false,
                    });
                  }
                  _titleController.text = "";
                  _descriptionController.text = "";

                  print(_titleController.text);
                  print(_descriptionController.text);
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
        );
      },
    );
  }

  IconButton _doneButton(int taskKey) {
    return IconButton(
      onPressed: () {
        final userTask = _user_task.get(
            taskKey); // Use get method instead of treating _user_task as a function
        userTask['isDone'] = true;
        _user_task.put(taskKey, userTask);
        _getUserTask();
        print(userTask['isDone']);
      },
      //icon checkbox when it is done
      icon: Icon(Icons.check_box_outline_blank),
    );
  }

  IconButton _undoneButton(int taskKey) {
    return IconButton(
      onPressed: () {
        final userTask = _user_task.get(
            taskKey); // Use get method instead of treating _user_task as a function
        userTask['isDone'] = false;
        _user_task.put(taskKey, userTask);
        _getUserTask();
        print(userTask['isDone']);
      },
      //icon checkbox when it is done
      icon: Icon(Icons.check_box),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _userTask.length,
        itemBuilder: (context, index) {
          final task = _userTask[index];
          return ListTile(
            title: Text(
              task['title'],
              style: TextStyle(
                decoration: task['isDone']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(task['description']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    _showForm(context, task['key']);
                  },
                  icon: Icon(Icons.edit),
                ),
                task['isDone']
                    ? _undoneButton(task['key'])
                    : _doneButton(task['key']),
                IconButton(
                  onPressed: () {
                    _user_task.delete(task['key']);
                    _getUserTask();
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(context, null);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

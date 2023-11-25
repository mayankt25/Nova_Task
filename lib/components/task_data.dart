import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Welcome to NovaTask!'),
    Task(name: 'Click \'+\' to add a new item'),
    Task(name: 'Long press on any item to delete'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
}

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTitle){
    _tasks.add(Task(name: newTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
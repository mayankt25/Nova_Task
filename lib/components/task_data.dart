import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  TaskData() {
    _loadTasks();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTitle) {
    _tasks.add(Task(name: newTitle));
    _saveTasks();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    _saveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _saveTasks();
    notifyListeners();
  }

  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = _tasks.map((task) => task.toMap()).toList();
    prefs.setString('tasks', jsonEncode(taskList));
  }


  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

    if (isFirstLaunch) {
      _addDefaultTasks();
      prefs.setBool('firstLaunch', false);
    } else {
      final String? taskListString = prefs.getString('tasks');

      if (taskListString != null) {
        final Iterable decoded = jsonDecode(taskListString);
        _tasks.addAll(decoded.map((task) => Task.fromMap(task)));
        notifyListeners();
      }
    }
  }

  void _addDefaultTasks() {
    addTask('Welcome to NovaTask!');
    addTask('Click \'+\' to add a new item');
    addTask('Long press on any item to delete');
  }
}
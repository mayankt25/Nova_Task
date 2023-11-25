import 'package:flutter/material.dart';
import 'package:nova_task/components/task_tile.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index){
          return TaskTile(
            taskTitle: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            checkBoxCallback: (newValue){
              taskData.updateTask(taskData.tasks[index]);
            },
            longPressCallback: (){
              taskData.deleteTask(taskData.tasks[index]);
            },
          );
        }, itemCount: taskData.taskCount,
        );
      },
    );
  }
}
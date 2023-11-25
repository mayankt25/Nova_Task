import 'package:flutter/material.dart';
import '../constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final dynamic checkBoxCallback;
  final dynamic longPressCallback;

  const TaskTile({super.key, required this.taskTitle, required this.checkBoxCallback, required this.isChecked, required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
          taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: SizedBox(
        child: Checkbox(
          activeColor: kColorConstant,
          value: isChecked,
          onChanged: checkBoxCallback,
        )
      ),
    );
  }
}
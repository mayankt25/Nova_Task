import 'package:flutter/material.dart';
import '../components/task_data.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskName = '';
    return Container(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kColorConstant,
              fontSize: 30.0,
            ),
          ),
          TextField(
            cursorColor: kColorConstant,
            onChanged: (newText){
              newTaskName = newText;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kColorConstant,
                  width: 3.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          TextButton(
            onPressed: (){
              Provider.of<TaskData>(context, listen: false).addTask(newTaskName);
              Navigator.pop(context);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(kColorConstant),
            ),
            child: const Text(
                'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

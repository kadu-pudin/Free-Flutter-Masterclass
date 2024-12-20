import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final ToDoDatabase db = ToDoDatabase();

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 18, left: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
            )
          ]),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.blueGrey[900],
                  checkColor: Colors.blueGrey,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: taskCompleted
                          ? Colors.blueGrey[700]
                          : Colors.blueGrey[900],
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/data/database.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? deleteFunction;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 24, right: 18, left: 18),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Slidable(
                endActionPane: ActionPane(motion: StretchMotion(), children: [
                  CustomSlidableAction(
                    onPressed: deleteFunction,
                    backgroundColor: Colors.red.shade400,
                    child: Icon(
                      Icons.delete,
                      color: Colors.blueGrey[900],
                    ),
                  )
                ]),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Checkbox(
                          value: taskCompleted,
                          onChanged: onChanged,
                          activeColor: Theme.of(context).colorScheme.secondary,
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 1.5)),
                      Text(
                        taskName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: taskCompleted
                                ? Theme.of(context).colorScheme.surfaceBright
                                : Theme.of(context).colorScheme.secondary,
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                    ],
                  ),
                ))));
  }
}

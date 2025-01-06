import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyHabitTile extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? editHabit;
  final void Function(BuildContext)? deleteHabit;
  const MyHabitTile(
      {super.key,
      required this.text,
      required this.isCompleted,
      required this.onChanged,
      required this.editHabit,
      required this.deleteHabit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isCompleted
              ? Colors.lightGreen
              : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(top: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: editHabit,
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                icon: Icons.edit,
              ),
              SlidableAction(
                onPressed: deleteHabit,
                backgroundColor: Colors.redAccent,
                icon: Icons.delete,
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              if (onChanged != null) {
                onChanged!(!isCompleted);
              }
            },
            child: Container(
              padding: EdgeInsets.all(15),
              child: ListTile(
                title: Text(text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isCompleted
                            ? Colors.black
                            : Theme.of(context).colorScheme.inversePrimary)),
                trailing: Checkbox(
                    value: isCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.lightGreen),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

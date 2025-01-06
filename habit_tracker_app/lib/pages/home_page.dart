import 'package:flutter/material.dart';
import 'package:habit_tracker_app/components/mybutton.dart';
import 'package:habit_tracker_app/components/mydrawer.dart';
import 'package:habit_tracker_app/components/myhabittile.dart';
import 'package:habit_tracker_app/components/myheatmap.dart';
import 'package:habit_tracker_app/database/habit_database.dart';
import 'package:habit_tracker_app/models/habit.dart';
import 'package:habit_tracker_app/utilities/habit_util.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HabitDatabase>().readHabits();
  }

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: TextField(
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: 'Create New Habit',
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none)),
          controller: textController,
        ),
        actions: [
          MyButton(
              title: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
                textController.clear();
              }),
          MyButton(
              title: 'Save',
              onPressed: () {
                if (textController.text != '') {
                  context.read<HabitDatabase>().addHabit(textController.text);
                  Navigator.pop(context);
                  textController.clear();
                }
              })
        ],
      ),
    );
  }

  void checkOnOff(bool? value, Habit habit) {
    if (value != null) {
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }
  }

  void editHabitBox(Habit habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: 'Edit Habit',
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none)),
          controller: textController,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        actions: [
          MyButton(
              title: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
                textController.clear();
              }),
          MyButton(
              title: 'Save',
              onPressed: () {
                final newName = textController.text;
                context.read<HabitDatabase>().editHabitName(habit.id, newName);
                Navigator.pop(context);
                textController.clear();
              })
        ],
      ),
    );
  }

  void deleteHabitBox(Habit habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Are you sure you want to delete?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        actions: [
          MyButton(title: 'Cancel', onPressed: () => Navigator.pop(context)),
          MyButton(
              title: 'Delete',
              onPressed: () {
                context.read<HabitDatabase>().deleteHabit(habit.id);
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: createNewHabit,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildHeatMap(),
            Center(
              child: Text('Slide to the left to edit/delete a habit',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary)),
            ),
            _buildHabitList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeatMap() {
    final habitDataBase = context.watch<HabitDatabase>();

    List<Habit> currentHabits = habitDataBase.currentHabits;

    return FutureBuilder<DateTime?>(
        future: habitDataBase.getFirstLaunchDate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHeatMap(
                startDate: snapshot.data!,
                datasets: prepareHeatMap(currentHabits));
          } else {
            return Container();
          }
        });
  }

  Widget _buildHabitList() {
    final habitDataBase = context.watch<HabitDatabase>();

    List<Habit> currentHabits = habitDataBase.currentHabits;

    return ListView.builder(
      itemCount: currentHabits.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = currentHabits[index];

        bool isCompletedToday = isHabitCompletedToday(habit.completedDays);

        return MyHabitTile(
          text: habit.name,
          isCompleted: isCompletedToday,
          onChanged: (value) => checkOnOff(value, habit),
          editHabit: (context) => editHabitBox(habit),
          deleteHabit: (context) => deleteHabitBox(habit),
        );
      },
    );
  }
}

import 'package:habit_tracker_app/models/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any((day) =>
      day.year == today.year &&
      day.month == today.month &&
      day.day == today.day);
}

Map<DateTime, int> prepareHeatMap(List<Habit> habits) {
  Map<DateTime, int> dataset = {};

  for (var habit in habits) {
    for (var date in habit.completedDays) {
      final normalizedDate = DateTime(date.year, date.month, date.day);

      if (dataset.containsKey(normalizedDate)) {
        dataset[normalizedDate] = dataset[normalizedDate]! + 1;
      } else {
        dataset[normalizedDate] = 1;
      }
    }
  }

  return dataset;
}
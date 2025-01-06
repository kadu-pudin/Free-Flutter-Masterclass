import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime startDate;
  final Map<DateTime, int> datasets;
  const MyHeatMap({
    super.key,
    required this.startDate,
    required this.datasets,
  });

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      startDate: startDate,
      endDate: DateTime.now(),
      datasets: datasets,
      colorMode: ColorMode.color,
      defaultColor: Theme.of(context).colorScheme.primary,
      textColor: Theme.of(context).colorScheme.inversePrimary,
      showText: true,
      showColorTip: false,
      scrollable: true,
      size: 30,
      colorsets: {
        1: Colors.lightGreen.shade200,
        2: Colors.lightGreen.shade300,
        3: Colors.lightGreen.shade400,
        4: Colors.lightGreen.shade500,
        5: Colors.lightGreen.shade600
      },
    );
  }
}

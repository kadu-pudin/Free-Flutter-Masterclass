import 'package:flutter/material.dart';
import 'package:responsive_design/constants.dart';
import 'package:responsive_design/util/my_box.dart';
import 'package:responsive_design/util/my_tile.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Desktop App', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            myDrawer,
            VerticalDivider(
              color: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return MyBox();
                        },
                      ),
                    ),
                  ),

                  // some tiles under it
                  Expanded(
                      child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return MyTile();
                    },
                  ))
                ],
              ),
            ),
            VerticalDivider(
              color: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary))),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

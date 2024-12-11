import 'package:flutter/material.dart';

class MealsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ["فطور", "سناك", "غداء", "عشاء"].map((meal) {
        return buildMealCircle(context, meal);
      }).toList(),
    );
  }

  Widget buildMealCircle(BuildContext context, String meal) {
    return GestureDetector(
      onTap: () => showMealDialog(context, meal),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Color.fromARGB(255, 125, 130, 227),
        child: Text(
          meal,
          style: TextStyle(color: const Color.fromARGB(255, 57, 55, 55)),
        ),
      ),
    );
  }

  void showMealDialog(BuildContext context, String meal) {
    List<String> items = [" 1", " 2", " 3"];
    List<String> selectedItems = [];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(' $meal'),
              content: buildItemSelection(items, selectedItems, setState),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildItemSelection(
    List<String> items,
    List<String> selectedItems,
    void Function(void Function()) setState,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) {
          return CheckboxListTile(
            title: Text(item),
            value: selectedItems.contains(item),
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedItems.add(item);
                } else {
                  selectedItems.remove(item);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

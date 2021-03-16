import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    // argument from the meal_item.dart
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Container(
        child: Text('Meal Screen ${mealId}'),
      ),
    );
  }
}

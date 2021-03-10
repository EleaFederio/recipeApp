import 'package:flutter/material.dart';
import 'package:mealApp/dummy_data.dart';
import 'package:mealApp/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Recipes'),
      ),
      body: GridView(
        padding: EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((categoryData) => CategoryItem(
                categoryData.id, categoryData.title, categoryData.color))
            .toList(),
      ),
    );
  }
}

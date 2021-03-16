import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealApp/screens/categories_screen.dart';
import 'package:mealApp/screens/category_meals.dart';
import 'package:mealApp/screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color.fromRGBO(237, 229, 204, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Color.fromRGBO(237, 229, 204, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(100, 136, 19, 1),
            ),
            title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      body: Center(
        child: Text('Navigation Time'),
      ),
    );
  }
}

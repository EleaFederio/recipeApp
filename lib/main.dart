import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealApp/dummy_data.dart';
import 'package:mealApp/models/meal.dart';
import 'package:mealApp/screens/category_meals.dart';
import 'package:mealApp/screens/filter_screen.dart';
import 'package:mealApp/screens/meal_detail_screen.dart';
import 'package:mealApp/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        // ignore: missing_return
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId );
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

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
        // '/': (context) => CategoriesScreen(),
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (context) => FilterScreen(_filters, _setFilters),
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

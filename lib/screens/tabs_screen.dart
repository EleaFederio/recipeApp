import 'package:flutter/material.dart';
import 'package:mealApp/models/meal.dart';
import 'package:mealApp/screens/categories_screen.dart';
import 'package:mealApp/screens/favorites_screen.dart';
import 'package:mealApp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> _favoriteMeals;
  TabsScreen(this._favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // List<Widget> _pages = [CategoriesScreen(), FavoritesScreen()];
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;


  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget._favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   // initialIndex: 1,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(icon: Icon(Icons.category), text: 'Categories'),
    //           Tab(icon: Icon(Icons.star), text: 'Favorites')
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites')),
        ],
      ),
    );
  }
}

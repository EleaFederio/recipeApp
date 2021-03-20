import 'package:flutter/material.dart';
import 'package:mealApp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 120.0,
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              color: Colors.amber.shade300,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            _buildListTile('Meals', Icons.restaurant, () {
              // pushReplacementNamed delete and replace previous screen
              Navigator.of(context).pushReplacementNamed('/');
            }),
            _buildListTile('Filters', Icons.settings, () {
              // pushReplacementNamed will delete the stack from the route when app add another screen
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}

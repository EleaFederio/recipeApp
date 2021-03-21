import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealApp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  // FilterScreen(setFilters);
  final Map<String, bool> _curentFilters;
  final Function _saveFilters;

  FilterScreen(this._curentFilters, this._saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget._curentFilters['gluten'];
    _lactoseFree = widget._curentFilters['lactose'];
    _vegan = widget._curentFilters['vegan'];
    _vegetarian = widget._curentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updatedValue){
    return SwitchListTile(
      activeColor: Colors.white,
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updatedValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              // call the saveFilter from FilterScreen Class
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget._saveFilters(selectedFilters);
              },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten meals',
                  _glutenFree,
                    (newValue){
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }
                ),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only include gluten meals',
                    _vegetarian,
                        (newValue){
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }
                ),
                _buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                        (newValue){
                      setState(() {
                        _vegan = newValue;
                      });
                    }
                ),
                _buildSwitchListTile(
                    'Lactose',
                    'Only include lactose-free meals',
                    _lactoseFree,
                        (newValue){
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}

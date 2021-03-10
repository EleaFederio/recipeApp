import 'package:flutter/material.dart';

class Category{
  final String id;
  final String title;
  final Color color;

  // categories objects cat be change after it was been created
  const Category({
    @required this.id, 
    @required this.title, 
    this.color = Colors.orange
  });

}
import 'package:flutter/material.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    this.complexity,
    this.id,
    this.affordability,
    this.categories,
    this.duration,
    this.imageUrl,
    this.ingredients,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
    this.steps,
    this.title
  });
}

enum Complexity { Simple ,Challenging, Hard, }

enum Affordability { Affordable, Pricey, Luxurious }

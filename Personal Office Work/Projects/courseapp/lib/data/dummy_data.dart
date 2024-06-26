import 'package:flutter/material.dart';

import '../models/categorys.dart';
import '../models/meal.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Chinese',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Indian',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Mexican',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Thai',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Japanese',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'French',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'American',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Greek',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Spanish',
    color: Colors.teal,
  ),
];
const dummyMeals = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://t3.ftcdn.net/jpg/06/53/02/64/360_F_653026495_ZmK9aF4vLIbScED62p6BlzrluL0Q9IJo.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water add salt to it once it boils.',
      'Put the spaghetti into the boiling water they should be done any Spices',
      'Cheese (optional)' 'Cut the tomatoes and the onion into small pieces.',
      'Boil some water add salt to it once it boils.',
      'Put the spaghetti into the boiling water they should be done any Spices',
      'Cheese (optional)'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://t3.ftcdn.net/jpg/06/53/02/64/360_F_653026495_ZmK9aF4vLIbScED62p6BlzrluL0Q9IJo.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water add salt to it once it boils.',
      'Put the spaghetti into the boiling water they should be done any Spices',
      'Cheese (optional)' 'Cut the tomatoes and the onion into small pieces.',
      'Boil some water add salt to it once it boils.',
      'Put the spaghetti into the boiling water they should be done any Spices',
      'Cheese (optional)'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://t3.ftcdn.net/jpg/06/53/02/64/360_F_653026495_ZmK9aF4vLIbScED62p6BlzrluL0Q9IJo.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water add salt to it once it boils.',
      'Put the spaghetti into the boiling water they should be done any Spices',
      'Cheese (optional)' 'Cut the tomatoes and the onion into small pieces.',
      'Boil some water add salt to it once it boils.',
      'Put the spaghetti into the boiling water they should be done any Spices',
      'Cheese (optional)'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
];

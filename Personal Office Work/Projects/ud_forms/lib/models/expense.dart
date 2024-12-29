import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoriesIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expense});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expense = allExpense
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expense;

  double get totalExpense {
    double sum = 0;
    for (final expense in expense) {
      sum += expense.amount;
    }
    return sum;
  }
}

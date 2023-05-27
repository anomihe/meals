import 'package:flutter/material.dart';
import 'package:mealssec/data/dummy_data.dart';
import 'package:mealssec/screens/meals.dart';
import 'package:mealssec/widgets/category_grid_item.dart';

import '../models/category.dart';
import '../models/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MealsScreen(
        meals: filteredMeals,
        title: category.title,
        onToggleFavorite: onToggleFavorite,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => _selectCategory(context, category),
          )
      ],
    );
  }
}

extension Mine on double {
  SizedBox get height => SizedBox(
        height: this,
      );
  SizedBox get width => SizedBox(
        width: this,
      );
}

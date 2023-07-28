import 'package:ecommerce/core/entity/category.dart';
import 'package:flutter/material.dart';

class CategoriesLabel extends StatelessWidget {
  final List<Category> categories;

  const CategoriesLabel(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: 16,
        right: 8,
      ),
      scrollDirection: Axis.horizontal,
      children: List.generate(
        categories.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Chip(
            label: Text(categories[index].name),
          ),
        ),
      ),
    );
  }
}

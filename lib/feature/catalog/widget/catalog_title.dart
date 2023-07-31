import 'package:ecommerce/core/entity/catalog.dart';
import 'package:flutter/material.dart';

class CatalogTitle extends StatelessWidget {
  final Catalog catalog;

  const CatalogTitle(this.catalog, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      catalog.category.name,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

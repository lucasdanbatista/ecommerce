import 'package:ecommerce/core/entity/catalog.dart';
import 'package:ecommerce/feature/catalog/widget/product_card.dart';
import 'package:flutter/material.dart';

class CatalogProducts extends StatelessWidget {
  final Catalog catalog;

  const CatalogProducts(this.catalog, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 280,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          catalog.products.length,
          (productIndex) => ProductCard(catalog.products[productIndex]),
        ),
      ),
    );
  }
}

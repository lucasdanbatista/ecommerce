import 'package:ecommerce/core/entity/catalog.dart';
import 'package:ecommerce/feature/catalog/widget/catalog_products.dart';
import 'package:ecommerce/feature/catalog/widget/catalog_title.dart';
import 'package:flutter/material.dart';

class CatalogListView extends StatelessWidget {
  final List<Catalog> catalogs;

  const CatalogListView(this.catalogs, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          catalogs.length,
          (index) => Wrap(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: CatalogTitle(catalogs[index]),
              ),
              CatalogProducts(catalogs[index]),
            ],
          ),
        ),
      ),
    );
  }
}

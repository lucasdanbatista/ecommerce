import 'package:ecommerce/core/entity/catalog.dart';
import 'package:ecommerce/feature/catalog/catalog_controller.dart';
import 'package:ecommerce/feature/catalog/catalog_result.dart';
import 'package:ecommerce/feature/catalog/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CatalogPage extends StatelessWidget {
  final CatalogController controller;

  CatalogPage({
    super.key,
    required this.controller,
  }) {
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
        actions: [
          IconButton(
            onPressed: () => throw UnimplementedError(),
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (controller.result is SuccessCatalogResult) {
            return _success(context, (controller.result as SuccessCatalogResult).catalogs);
          } else {
            return _loading();
          }
        },
      ),
    );
  }

  Widget _success(BuildContext context, List<Catalog> catalogs) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          catalogs.length,
          (catalogIndex) => Wrap(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text(
                  catalogs[catalogIndex].category.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 280,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    catalogs[catalogIndex].products.length,
                    (productIndex) => ProductCard(catalogs[catalogIndex].products[productIndex]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

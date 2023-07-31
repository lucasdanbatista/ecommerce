import 'package:ecommerce/feature/catalog/catalog_controller.dart';
import 'package:ecommerce/feature/catalog/catalog_result.dart';
import 'package:ecommerce/feature/catalog/widget/catalog_list_view.dart';
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
        centerTitle: true,
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
            return CatalogListView((controller.result as SuccessCatalogResult).catalogs);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

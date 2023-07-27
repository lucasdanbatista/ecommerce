import 'package:ecommerce/feature/catalog/catalog_controller.dart';
import 'package:ecommerce/feature/catalog/catalog_result.dart';
import 'package:ecommerce/feature/catalog/widget/product_list_tile.dart';
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
        title: const Text('Produtos'),
      ),
      body: Observer(
        builder: (context) {
          if (controller.result is SuccessCatalogResult) {
            return _success(controller.result as SuccessCatalogResult);
          } else {
            return _loading();
          }
        },
      ),
    );
  }

  Widget _success(SuccessCatalogResult result) {
    return ListView.builder(
      itemCount: result.catalog.length,
      itemBuilder: (context, index) => ProductListTile(result.catalog[index]),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

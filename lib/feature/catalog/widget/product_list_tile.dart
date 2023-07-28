import 'package:ecommerce/core/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductListTile extends StatelessWidget {
  final Product product;

  const ProductListTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      onTap: () => Modular.to.pushNamed('/pdp/${product.id}'),
    );
  }
}

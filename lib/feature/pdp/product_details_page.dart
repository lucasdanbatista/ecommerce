import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/feature/pdp/product_details_controller.dart';
import 'package:ecommerce/feature/pdp/product_details_result.dart';
import 'package:ecommerce/feature/pdp/widget/categories_label.dart';
import 'package:ecommerce/feature/pdp/widget/header.dart';
import 'package:ecommerce/feature/pdp/widget/photo_slider.dart';
import 'package:ecommerce/feature/pdp/widget/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductDetailsController controller;

  ProductDetailsPage(
    String productId, {
    super.key,
    required this.controller,
  }) {
    controller.findById(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do produto'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => throw UnimplementedError(),
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          if (controller.result is SuccessProductDetailsResult) {
            return _success(context, (controller.result as SuccessProductDetailsResult).product);
          } else {
            return _loading();
          }
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton.icon(
          onPressed: () => throw UnimplementedError(),
          icon: const Icon(Icons.add_shopping_cart_outlined),
          label: const Text('ADICIONAR AO CARRINHO'),
        ),
      ],
    );
  }

  Widget _success(BuildContext context, Product product) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 56),
      children: [
        PhotoSlider(
          product.photos,
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.width,
          ),
        ),
        SizedBox(
          height: 72,
          width: MediaQuery.of(context).size.width,
          child: CategoriesLabel(product.category.flatten.toList()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Header(product),
        ),
        ProductInfo(product),
      ],
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

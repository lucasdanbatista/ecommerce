import 'package:ecommerce/core/entity/offer.dart';
import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/feature/pdp/product_details_controller.dart';
import 'package:ecommerce/feature/pdp/product_details_result.dart';
import 'package:ecommerce/feature/pdp/widget/cash_offer_text.dart';
import 'package:ecommerce/feature/pdp/widget/categories_label.dart';
import 'package:ecommerce/feature/pdp/widget/credit_offer_text.dart';
import 'package:ecommerce/feature/pdp/widget/photo_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 4,
                ),
                child: CashOfferText(product.offers.whereType<CashOffer>().first),
              ),
              CreditOfferText(product.offers.whereType<CreditOffer>().first),
              const Padding(padding: EdgeInsets.only(top: 12)),
              Text.rich(
                TextSpan(
                  text: 'Vendido e entregue por ',
                  children: [
                    TextSpan(
                      text: product.seller.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Text(
            'Informações do produto',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ExpansionTile(
          title: const Text('Descrição'),
          children: [
            ListTile(
              title: MarkdownBody(
                data: product.description,
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Especificações técnicas'),
          children: [
            ListTile(
              title: MarkdownBody(
                data: product.techSpecs,
              ),
            )
          ],
        ),
        ExpansionTile(
          title: const Text('Dimensões'),
          children: [
            ListTile(
              title: MarkdownBody(
                data: product.dimensions,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

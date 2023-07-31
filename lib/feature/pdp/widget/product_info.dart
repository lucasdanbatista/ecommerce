import 'package:ecommerce/core/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
}

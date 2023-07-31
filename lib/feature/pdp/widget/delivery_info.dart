import 'package:ecommerce/core/entity/product.dart';
import 'package:flutter/material.dart';

class DeliveryInfo extends StatelessWidget {
  final Product product;

  const DeliveryInfo(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
    );
  }
}

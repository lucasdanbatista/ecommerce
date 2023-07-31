import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/feature/pdp/widget/delivery_info.dart';
import 'package:ecommerce/feature/pdp/widget/offers.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Product product;

  const Header(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: Theme.of(context).textTheme.headlineMedium,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Offers(product),
        ),
        DeliveryInfo(product),
      ],
    );
  }
}

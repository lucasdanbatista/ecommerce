import 'package:ecommerce/core/entity/offer.dart';
import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/feature/pdp/widget/cash_offer_text.dart';
import 'package:ecommerce/feature/pdp/widget/credit_offer_text.dart';
import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  final Product product;

  const Offers(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 4,
      children: [
        CashOfferText(product.offers.whereType<CashOffer>().first),
        CreditOfferText(product.offers.whereType<CreditOffer>().first),
      ],
    );
  }
}

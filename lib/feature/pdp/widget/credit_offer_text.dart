import 'package:ecommerce/core/entity/offer.dart';
import 'package:ecommerce/util/formatters.dart';
import 'package:flutter/material.dart';

class CreditOfferText extends StatelessWidget {
  final CreditOffer offer;

  const CreditOfferText(this.offer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'ou até ${offer.installments}x de ',
        style: _priceStyle(context),
        children: [
          TextSpan(
            text: formatCurrency(offer.installmentValue),
            style: _priceStyle(context)?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle? _priceStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).disabledColor,
        );
  }
}

import 'package:ecommerce/core/entity/offer.dart';
import 'package:ecommerce/util/formatters.dart';
import 'package:flutter/material.dart';

class CashOfferText extends StatelessWidget {
  final CashOffer offer;

  const CashOfferText(this.offer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text.rich(
          TextSpan(
            text: 'De ',
            style: _priceStyle(context),
            children: [
              TextSpan(
                text: formatCurrency(offer.from),
                style: _priceStyle(context)?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
        Text(
          'Por ${formatCurrency(offer.by)} à vista',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  TextStyle? _priceStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).disabledColor,
        );
  }
}

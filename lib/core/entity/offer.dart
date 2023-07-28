import 'package:ecommerce/core/entity/entity.dart';

abstract class Offer extends Entity {
  late double by;

  Offer({
    double? by,
  }) {
    if (by != null) this.by = by;
  }
}

class CashOffer extends Offer {
  late double from;

  CashOffer({
    double? from,
    super.by,
  }) {
    if (from != null) this.from = from;
  }
}

class CreditOffer extends Offer {
  late int installments;

  CreditOffer({
    super.by,
    int? installments,
  }) {
    if (installments != null) this.installments = installments;
  }

  double get installmentValue => by / installments;
}

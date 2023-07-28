import 'package:ecommerce/core/dto/offer_dto.dart';
import 'package:ecommerce/core/entity/offer.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';

class OfferMapper implements EntityMapper<OfferDTO, Offer> {
  @override
  Offer toEntity(OfferDTO it) {
    switch (it.runtimeType) {
      case CashOfferDTO:
        return CashOffer(
          from: (it as CashOfferDTO).from,
          by: it.by,
        );
      case CreditOfferDTO:
        return CreditOffer(
          by: it.by,
          installments: (it as CreditOfferDTO).installments,
        );
      default:
        throw UnsupportedError('${it.runtimeType} is not supported');
    }
  }
}

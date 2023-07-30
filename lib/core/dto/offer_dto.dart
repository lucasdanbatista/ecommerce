import 'package:json_annotation/json_annotation.dart';

part 'offer_dto.g.dart';

abstract class OfferDTO {
  double? by;

  OfferDTO({
    this.by,
  });

  factory OfferDTO.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    switch (type) {
      case 'cash':
        return _$CashOfferDTOFromJson(json);
      case 'credit':
        return _$CreditOfferDTOFromJson(json);
      default:
        throw UnsupportedError('$type is not supported');
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class CashOfferDTO extends OfferDTO {
  double? from;

  CashOfferDTO({
    this.from,
  });

  @override
  Map<String, dynamic> toJson() => _$CashOfferDTOToJson(this);
}

@JsonSerializable()
class CreditOfferDTO extends OfferDTO {
  int? installments;

  CreditOfferDTO({
    super.by,
    this.installments,
  });

  @override
  Map<String, dynamic> toJson() => _$CreditOfferDTOToJson(this);
}

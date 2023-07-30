import 'package:json_annotation/json_annotation.dart';

part 'seller_dto.g.dart';

@JsonSerializable()
class SellerDTO {
  String? name;

  SellerDTO({
    this.name,
  });

  factory SellerDTO.fromJson(Map<String, dynamic> json) => _$SellerDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SellerDTOToJson(this);
}

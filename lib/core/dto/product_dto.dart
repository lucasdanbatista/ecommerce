import 'package:ecommerce/core/dto/category_dto.dart';
import 'package:ecommerce/core/dto/offer_dto.dart';
import 'package:ecommerce/core/dto/seller_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDTO {
  String? id;
  CategoryDTO? category;
  String? name;
  String? sku;
  int? price;
  int? discount;
  List<String>? photos;
  SellerDTO? seller;
  List<OfferDTO>? offers;
  String? description;
  String? techSpecs;
  String? dimensions;

  ProductDTO({
    this.id,
    this.category,
    this.name,
    this.sku,
    this.price,
    this.discount,
    this.photos,
    this.seller,
    this.offers,
    this.description,
    this.techSpecs,
    this.dimensions,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}

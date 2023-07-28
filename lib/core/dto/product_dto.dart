import 'package:ecommerce/core/dto/category_dto.dart';
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

  ProductDTO({
    this.id,
    this.category,
    this.name,
    this.sku,
    this.price,
    this.discount,
    this.photos,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}

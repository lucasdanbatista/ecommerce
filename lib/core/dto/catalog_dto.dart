import 'package:ecommerce/core/dto/category_dto.dart';
import 'package:ecommerce/core/dto/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_dto.g.dart';

@JsonSerializable()
class CatalogDTO {
  CategoryDTO? category;
  List<ProductDTO>? products;

  CatalogDTO({
    this.category,
    this.products,
  });

  factory CatalogDTO.fromJson(Map<String, dynamic> json) => _$CatalogDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogDTOToJson(this);
}

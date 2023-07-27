import 'package:ecommerce/core/dto/category_dto.dart';

class ProductDTO {
  CategoryDTO? category;
  String? name;
  String? sku;
  int? price;
  int? discount;
  List<String>? photos;

  ProductDTO({
    this.category,
    this.name,
    this.sku,
    this.price,
    this.discount,
    this.photos,
  });
}

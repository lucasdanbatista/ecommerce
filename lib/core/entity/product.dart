import 'package:ecommerce/core/entity/category.dart';

class Product {
  late Category category;
  late String name;
  late String sku;
  late double price;
  late double discount;
  late List<Uri> photos;

  Product({
    Category? category,
    String? name,
    String? sku,
    double? price,
    double? discount,
    List<Uri>? photos,
  }) {
    if (category != null) this.category = category;
    if (name != null) this.name = name;
    if (sku != null) this.sku = sku;
    if (price != null) this.price = price;
    if (discount != null) this.discount = discount;
    if (photos != null) this.photos = photos;
  }
}

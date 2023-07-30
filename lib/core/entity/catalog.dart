import 'package:ecommerce/core/entity/category.dart';
import 'package:ecommerce/core/entity/entity.dart';
import 'package:ecommerce/core/entity/product.dart';

class Catalog extends Entity {
  late Category category;
  late List<Product> products;

  Catalog({
    Category? category,
    List<Product>? products,
  }) {
    if (category != null) this.category = category;
    if (products != null) this.products = products;
  }
}

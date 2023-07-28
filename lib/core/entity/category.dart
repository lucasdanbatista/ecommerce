import 'package:ecommerce/core/entity/entity.dart';

class Category extends Entity {
  late String name;
  Category? child;

  Category({
    String? name,
    this.child,
  }) {
    if (name != null) this.name = name;
  }

  List<Category> get flatten {
    final categories = <Category>[];
    Category? next = this;
    while (next != null) {
      categories.add(next);
      next = next.child;
    }
    return categories;
  }
}

import 'package:ecommerce/core/entity/entity.dart';

class Seller extends Entity {
  late String name;

  Seller({
    String? name,
  }) {
    if (name != null) this.name = name;
  }
}

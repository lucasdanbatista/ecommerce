import 'package:ecommerce/core/entity/catalog.dart';
import 'package:ecommerce/core/entity/product.dart';

abstract interface class ProductRepository {
  Future<List<Catalog>> getCatalogs();

  Future<Product> findById(String id);
}

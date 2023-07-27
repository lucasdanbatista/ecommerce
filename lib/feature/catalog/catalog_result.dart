import 'package:ecommerce/core/entity/product.dart';

abstract class CatalogResult {}

class LoadingCatalogResult extends CatalogResult {}

class SuccessCatalogResult extends CatalogResult {
  final List<Product> catalog;

  SuccessCatalogResult(this.catalog);
}

class FailureCatalogResult extends CatalogResult {}

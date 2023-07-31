import 'package:ecommerce/core/entity/catalog.dart';

abstract class CatalogResult {}

class LoadingCatalogResult extends CatalogResult {}

class SuccessCatalogResult extends CatalogResult {
  final List<Catalog> catalogs;

  SuccessCatalogResult(this.catalogs);
}

class FailureCatalogResult extends CatalogResult {}

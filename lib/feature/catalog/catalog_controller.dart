import 'package:ecommerce/core/repository/product_repository.dart';
import 'package:ecommerce/feature/catalog/catalog_result.dart';
import 'package:mobx/mobx.dart';

part 'catalog_controller.g.dart';

class CatalogController = CatalogControllerBase with _$CatalogController;

abstract class CatalogControllerBase with Store {
  final ProductRepository _repository;

  CatalogControllerBase(this._repository);

  @observable
  CatalogResult result = LoadingCatalogResult();

  @action
  Future<void> fetch() async {
    try {
      final catalogs = await _repository.getCatalogs();
      result = SuccessCatalogResult(catalogs);
    } catch (e) {
      result = FailureCatalogResult();
      rethrow;
    }
  }
}

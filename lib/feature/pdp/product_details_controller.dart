import 'package:ecommerce/core/repository/product_repository.dart';
import 'package:ecommerce/feature/pdp/product_details_result.dart';
import 'package:mobx/mobx.dart';

part 'product_details_controller.g.dart';

class ProductDetailsController = ProductDetailsControllerBase with _$ProductDetailsController;

abstract class ProductDetailsControllerBase with Store {
  final ProductRepository _repository;

  @observable
  ProductDetailsResult result = LoadingProductDetailsResult();

  ProductDetailsControllerBase(this._repository);

  @action
  Future<void> findById(String id) async {
    try {
      final product = await _repository.findById(id);
      result = SuccessProductDetailsResult(product);
    } catch (e) {
      result = FailureProductDetailsResult();
      rethrow;
    }
  }
}

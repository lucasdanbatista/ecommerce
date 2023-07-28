import 'package:ecommerce/core/entity/product.dart';

abstract class ProductDetailsResult {}

class LoadingProductDetailsResult extends ProductDetailsResult {}

class SuccessProductDetailsResult extends ProductDetailsResult {
  final Product product;

  SuccessProductDetailsResult(this.product);
}

class FailureProductDetailsResult extends ProductDetailsResult {}

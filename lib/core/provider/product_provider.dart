import 'package:ecommerce/core/dto/product_dto.dart';

abstract interface class ProductProvider {
  Future<List<ProductDTO>> getCatalog();

  Future<ProductDTO> findById(String id);
}

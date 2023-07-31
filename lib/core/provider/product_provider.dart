import 'package:ecommerce/core/dto/catalog_dto.dart';
import 'package:ecommerce/core/dto/product_dto.dart';

abstract interface class ProductProvider {
  Future<List<CatalogDTO>> getCatalogs();

  Future<ProductDTO> findById(String id);
}

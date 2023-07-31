import 'package:ecommerce/core/dto/catalog_dto.dart';
import 'package:ecommerce/core/dto/product_dto.dart';
import 'package:ecommerce/core/entity/catalog.dart';
import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';
import 'package:ecommerce/core/provider/product_provider.dart';
import 'package:ecommerce/core/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductProvider _provider;
  final EntityMapper<CatalogDTO, Catalog> _catalogMapper;
  final EntityMapper<ProductDTO, Product> _productMapper;

  ProductRepositoryImpl(this._provider, this._catalogMapper, this._productMapper);

  @override
  Future<List<Catalog>> getCatalogs() async {
    final dtos = await _provider.getCatalogs();
    return dtos.map(_catalogMapper.toEntity).toList();
  }

  @override
  Future<Product> findById(String id) async {
    final dto = await _provider.findById(id);
    return _productMapper.toEntity(dto);
  }
}

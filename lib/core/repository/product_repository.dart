import 'package:ecommerce/core/dto/product_dto.dart';
import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';
import 'package:ecommerce/core/provider/product_provider.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getCatalog();

  Future<Product> findById(String id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductProvider _provider;
  final EntityMapper<ProductDTO, Product> _mapper;

  ProductRepositoryImpl(this._provider, this._mapper);

  @override
  Future<List<Product>> getCatalog() async {
    final dtos = await _provider.getCatalog();
    return dtos.map((e) => _mapper.toEntity(e)).toList();
  }

  @override
  Future<Product> findById(String id) async {
    final dto = await _provider.findById(id);
    return _mapper.toEntity(dto);
  }
}

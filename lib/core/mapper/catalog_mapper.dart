import 'package:ecommerce/core/dto/catalog_dto.dart';
import 'package:ecommerce/core/entity/catalog.dart';
import 'package:ecommerce/core/mapper/category_mapper.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';
import 'package:ecommerce/core/mapper/product_mapper.dart';

class CatalogMapper implements EntityMapper<CatalogDTO, Catalog> {
  final CategoryMapper _categoryMapper;
  final ProductMapper _productMapper;

  CatalogMapper(this._categoryMapper, this._productMapper);

  @override
  Catalog toEntity(CatalogDTO it) {
    return Catalog(
      category: it.category != null ? _categoryMapper.toEntity(it.category!) : null,
      products: it.products != null ? it.products!.map(_productMapper.toEntity).toList() : null,
    );
  }
}

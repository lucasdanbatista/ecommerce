import 'package:ecommerce/core/dto/category_dto.dart';
import 'package:ecommerce/core/dto/product_dto.dart';
import 'package:ecommerce/core/entity/category.dart';
import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';

class ProductMapper implements EntityMapper<ProductDTO, Product> {
  final EntityMapper<CategoryDTO, Category> _categoryMapper;

  ProductMapper(this._categoryMapper);

  @override
  Product toEntity(ProductDTO it) {
    return Product(
      category: it.category != null ? _categoryMapper.toEntity(it.category!) : null,
      name: it.name,
      sku: it.sku,
      price: it.price != null ? it.price! / 100 : null,
      discount: it.discount != null ? it.discount! / 100 : null,
      photos: it.photos != null ? it.photos!.map((e) => Uri.parse(e)).toList() : null,
    );
  }
}

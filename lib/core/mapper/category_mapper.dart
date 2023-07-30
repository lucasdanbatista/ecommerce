import 'package:ecommerce/core/dto/category_dto.dart';
import 'package:ecommerce/core/entity/category.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';

class CategoryMapper implements EntityMapper<CategoryDTO, Category> {
  @override
  Category toEntity(CategoryDTO it) {
    return Category(
      name: it.name,
      child: it.child != null ? toEntity(it.child!) : null,
    );
  }
}

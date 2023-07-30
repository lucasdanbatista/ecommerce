import 'package:ecommerce/core/entity/entity.dart';

abstract interface class EntityMapper<I, O extends Entity> {
  O toEntity(I it);
}

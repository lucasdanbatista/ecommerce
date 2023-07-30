import 'package:ecommerce/core/dto/seller_dto.dart';
import 'package:ecommerce/core/entity/seller.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';

class SellerMapper implements EntityMapper<SellerDTO, Seller> {
  @override
  Seller toEntity(SellerDTO it) {
    return Seller(
      name: it.name,
    );
  }
}

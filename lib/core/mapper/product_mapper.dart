import 'package:ecommerce/core/dto/category_dto.dart';
import 'package:ecommerce/core/dto/offer_dto.dart';
import 'package:ecommerce/core/dto/product_dto.dart';
import 'package:ecommerce/core/dto/seller_dto.dart';
import 'package:ecommerce/core/entity/category.dart';
import 'package:ecommerce/core/entity/offer.dart';
import 'package:ecommerce/core/entity/product.dart';
import 'package:ecommerce/core/entity/seller.dart';
import 'package:ecommerce/core/mapper/entity_mapper.dart';

class ProductMapper implements EntityMapper<ProductDTO, Product> {
  final EntityMapper<CategoryDTO, Category> _categoryMapper;
  final EntityMapper<SellerDTO, Seller> _sellerMapper;
  final EntityMapper<OfferDTO, Offer> _offerMapper;

  ProductMapper(this._categoryMapper, this._sellerMapper, this._offerMapper);

  @override
  Product toEntity(ProductDTO it) {
    return Product(
      id: it.id,
      category: it.category != null ? _categoryMapper.toEntity(it.category!) : null,
      name: it.name,
      sku: it.sku,
      photos: it.photos != null ? it.photos!.map(Uri.parse).toList() : null,
      seller: it.seller != null ? _sellerMapper.toEntity(it.seller!) : null,
      offers: it.offers != null ? it.offers!.map(_offerMapper.toEntity).toList() : null,
      description: it.description,
      techSpecs: it.techSpecs,
      dimensions: it.dimensions,
    );
  }
}

import 'package:ecommerce/core/entity/category.dart';
import 'package:ecommerce/core/entity/entity.dart';
import 'package:ecommerce/core/entity/offer.dart';
import 'package:ecommerce/core/entity/seller.dart';

class Product extends Entity {
  late String id;
  late Category category;
  late String name;
  late String sku;
  late List<Uri> photos;
  late Seller seller;
  late List<Offer> offers;
  late String description;
  late String techSpecs;
  late String dimensions;

  Product({
    String? id,
    Category? category,
    String? name,
    String? sku,
    List<Uri>? photos,
    Seller? seller,
    List<Offer>? offers,
    String? description,
    String? techSpecs,
    String? dimensions,
  }) {
    if (id != null) this.id = id;
    if (category != null) this.category = category;
    if (name != null) this.name = name;
    if (sku != null) this.sku = sku;
    if (photos != null) this.photos = photos;
    if (seller != null) this.seller = seller;
    if (offers != null) this.offers = offers;
    if (description != null) this.description = description;
    if (techSpecs != null) this.techSpecs = techSpecs;
    if (dimensions != null) this.dimensions = dimensions;
  }
}

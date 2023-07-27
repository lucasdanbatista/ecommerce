import 'package:ecommerce/core/entity/category.dart';
import 'package:ecommerce/core/entity/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getCatalog();
}

class MockedProductRepository implements ProductRepository {
  final _products = List.generate(
    100,
    (index) => Product(
      name: 'Product $index',
      discount: 0,
      photos: [
        Uri.parse('https://picsum.photos/seed/$index/640/640'),
      ],
      price: 10.50,
      sku: index.toString(),
      category: Category(
        name: 'Eletrônicos',
      ),
    ),
  );

  @override
  Future<List<Product>> getCatalog() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _products;
  }
}

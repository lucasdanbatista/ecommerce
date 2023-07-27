import 'package:ecommerce/core/repository/product_repository.dart';
import 'package:ecommerce/feature/catalog/catalog_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => MockedProductRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: CatalogModule()),
      ];
}

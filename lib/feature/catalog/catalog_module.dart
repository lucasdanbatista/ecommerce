import 'package:ecommerce/feature/catalog/catalog_controller.dart';
import 'package:ecommerce/feature/catalog/catalog_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CatalogModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => CatalogController(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => CatalogPage(
            controller: Modular.get(),
          ),
        )
      ];
}

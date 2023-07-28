import 'package:ecommerce/feature/pdp/product_details_controller.dart';
import 'package:ecommerce/feature/pdp/product_details_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductDetailsModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/:id',
          child: (context, args) => ProductDetailsPage(
            args.params['id'],
            controller: ProductDetailsController(Modular.get()),
          ),
        ),
      ];
}

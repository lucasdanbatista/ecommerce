import 'package:dio/dio.dart';
import 'package:ecommerce/core/mapper/catalog_mapper.dart';
import 'package:ecommerce/core/mapper/category_mapper.dart';
import 'package:ecommerce/core/mapper/offer_mapper.dart';
import 'package:ecommerce/core/mapper/product_mapper.dart';
import 'package:ecommerce/core/mapper/seller_mapper.dart';
import 'package:ecommerce/core/provider/remote_product_provider.dart';
import 'package:ecommerce/core/repository/product_repository_impl.dart';
import 'package:ecommerce/feature/catalog/catalog_module.dart';
import 'package:ecommerce/feature/pdp/product_details_module.dart';
import 'package:ecommerce/util/environment.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) {
            final baseUrl = i.get<Environment>().apiBaseUrl.toString();
            final options = BaseOptions(baseUrl: baseUrl);
            return Dio(options)..interceptors.add(PrettyDioLogger());
          },
        ),
        Bind((i) => DebugEnvironment()),
        Bind((i) => CategoryMapper()),
        Bind((i) => SellerMapper()),
        Bind((i) => OfferMapper()),
        Bind((i) => CatalogMapper(i.get(), i.get())),
        Bind((i) => ProductMapper(i.get(), i.get(), i.get())),
        Bind((i) => RemoteProductProvider(i.get())),
        Bind((i) => ProductRepositoryImpl(i.get(), i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: CatalogModule()),
        ModuleRoute('/pdp', module: ProductDetailsModule()),
      ];
}

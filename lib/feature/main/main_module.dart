import 'package:dio/dio.dart';
import 'package:ecommerce/core/mapper/category_mapper.dart';
import 'package:ecommerce/core/mapper/product_mapper.dart';
import 'package:ecommerce/core/provider/remote_product_provider.dart';
import 'package:ecommerce/core/repository/product_repository.dart';
import 'package:ecommerce/feature/catalog/catalog_module.dart';
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
        Bind((i) => ProductMapper(i.get())),
        Bind((i) => RemoteProductProvider(i.get())),
        Bind((i) => ProductRepositoryImpl(i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: CatalogModule()),
      ];
}

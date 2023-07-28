import 'package:dio/dio.dart';
import 'package:ecommerce/core/dto/product_dto.dart';
import 'package:ecommerce/core/provider/product_provider.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_product_provider.g.dart';

@RestApi()
abstract class RemoteProductProvider implements ProductProvider {
  factory RemoteProductProvider(Dio dio) = _RemoteProductProvider;

  @GET('/v1/products')
  @override
  Future<List<ProductDTO>> getCatalog();

  @GET('/v1/products/{id}')
  @override
  Future<ProductDTO> findById(@Path('id') String id);
}

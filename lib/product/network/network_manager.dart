import 'dart:io';

import 'package:dio/dio.dart';
import 'package:task_app/product/network/base/base_error.dart';
import 'package:task_app/product/network/base/base_model.dart';
import 'package:task_app/product/utility/enums/service_path.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: ServicePath.baseApi.value,
    );
    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        print(BaseError(e.message ?? 'Hatanın kaynağı bulunamadı'));
        handler.next(e);
      },
    ));
  }

  late Dio _dio;

  
  Future<dynamic> dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e as Map<String, dynamic>)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody as Map<String, dynamic>);
        }
        return responseBody;
      default:
        return null;
    }
  }
}

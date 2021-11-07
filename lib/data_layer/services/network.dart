import 'package:dio/dio.dart';

class HttpService {
  late Dio _dio;

  final baseUrl = "https://csuot.herokuapp.com/v1/";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 40 * 1000, // 60 seconds,
      receiveTimeout: 40 * 1000,
    ));

    initializeInterceptors();
  }

  Future<dynamic> getList(String endPoint, String token) async {
    Response response;

    try {
      response = await _dio.get(
        endPoint,
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return null;
  }

  Future<dynamic> login(String endPoint, Map<String, dynamic> body) async {
    Response response;

    try {
      FormData formData = FormData.fromMap(body);
      response = await _dio.post(endPoint, data: formData);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        return {'message': 'incorrect email or password'};
      } else {
        return {'message': 'some error happen'};
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return null;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      print('${options.data}');
      print('${options.headers}');
      print('${options.path}');
      print('${options.baseUrl}');
      return handler.next(options);

      //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      print(response.data);
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print(e);

      return handler.next(e); //continue
    }));
  }
}

HttpService httpService = HttpService();

import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/routes/app_pages.dart';
import '../features/auth/models/get_storage_key.dart';
import '../features/auth/models/token_model.dart';
import '../features/auth/models/user_model.dart';


class MyApiProvider {
  final GetStorage _getStorage = GetStorage();
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'http://192.168.29.10:8080/api/v1/',
        connectTimeout: const Duration(seconds: 6000),
        receiveTimeout: const Duration(seconds: 6000),
        responseType: ResponseType.json,
        contentType: "application/json"),
  );

  MyApiProvider() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers["Accept"] = "application/json";
          final unprotectedPaths = [
            'auth/login',
            'auth/signup',
            'auth/refreshToken'
          ];
          bool isUnprotectedRoute =
              unprotectedPaths.any((path) => options.path.contains(path));
          if (!isUnprotectedRoute) {
            String? token = _getStorage.read(GetStorageKey.accessToken);
            if (token != null) {
              options.headers["Authorization"] = 'Bearer $token';
            }
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          const loginPath = 'auth/login';
          if (error.response?.statusCode == 401 &&
              !error.requestOptions.path.contains(loginPath)) {
            final newAccessToken = await refreshToken();
            if (newAccessToken != null) {
              _dio.options.headers["Authorization"] = 'Bearer $newAccessToken';
              return handler.resolve(await _dio.fetch(error.requestOptions));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

//refreshToken
  Future<String?> refreshToken() async {
    try {
      final refreshToken = _getStorage.read(GetStorageKey.refreshToken);
      final response = await _dio
          .post('auth/refreshToken', data: {'refreshToken': refreshToken});
      final newAccessToken = response.data['accessToken'];
      _getStorage.write(GetStorageKey.accessToken, newAccessToken);
      return newAccessToken;
    } catch (exception) {
      _getStorage.erase();
      Get.offAllNamed(Routes.login);
    }
    return null;
  }

//Login
  Future<TokenModel> login(Map<String, dynamic> map) async {
    try {
      final response = await _dio.post("auth/login", data: map);
      return tokenModelFromJson(response.toString());
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        return Future.error("Invalid Credentials");
      } else {
        return Future.error("Internal Server Error");
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<UserModel> getProfile() async {
    try {
      final response = await _dio.get("users/me");
      return userModelFromJson(response.toString());
    } on DioException catch (err) {
      return Future.error(err.toString());
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}

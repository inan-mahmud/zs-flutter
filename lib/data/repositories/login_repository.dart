import 'package:dio/dio.dart';
import 'package:zstask/constants/urls.dart';
import 'package:zstask/data/models/login_model.dart';
import 'package:zstask/utils/helpers/failure.dart';

abstract class LoginRepository {
  Future<LoginModel> signIn(Map<String, dynamic> data);
}

class LoginRepositoryImpl extends LoginRepository {
  final Dio _dio;

  LoginRepositoryImpl(this._dio);

  @override
  Future<LoginModel> signIn(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(URLs.loginUrl, data: data);
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      throwFailure(e.response.statusCode);
    }
  }
}

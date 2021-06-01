import 'package:dio/dio.dart';
import 'package:zstask/constants/urls.dart';
import 'package:zstask/data/models/menus/menu.dart';
import 'package:zstask/utils/helpers/failure.dart';

abstract class MenuRepository {
  Future<List<MenuModel>> fetchMenus();
}

class MenuRepositoryImpl extends MenuRepository {
  final Dio _dio;

  MenuRepositoryImpl(this._dio);

  @override
  Future<List<MenuModel>> fetchMenus() async {
    try {
      final response = await _dio.get(URLs.menuUrl);
      return (response.data as List)
          .map((menu) => MenuModel.fromJson(menu))
          .toList();
    } on DioError catch (e) {
      throwFailure(e.response.statusCode);
    }
  }
}

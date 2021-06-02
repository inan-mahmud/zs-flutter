import 'package:get/get.dart';
import 'package:zstask/controllers/authentication_controller.dart';
import 'package:zstask/data/models/menus/menu.dart';
import 'package:zstask/data/repositories/menu_repository.dart';
import 'package:zstask/utils/helpers/failure.dart';
import 'package:zstask/utils/response/api_response.dart';

class MenuController extends GetxController {
  final MenuRepository _menuRepository;

  MenuController(this._menuRepository);

  final apiResponse = Rx<ApiResponse<List<MenuModel>>>(
      ApiResponse.loading("Fetching Menus...Please wait"));

  @override
  void onInit() {
    super.onInit();
    fetchMenus();
  }

  void fetchMenus() async {
    try {
      List<MenuModel> menuList = await _menuRepository.fetchMenus();
      menuList.sort(
          (prevMenu, nextMenu) => prevMenu.weight.compareTo(nextMenu.weight));
      apiResponse.value = ApiResponse.completed(menuList);
    } on Failure catch (e) {
      apiResponse.value = ApiResponse.error(e.message);
    }
  }

  void signOut() async {
    AuthenticationController.to.signOut();
  }
}

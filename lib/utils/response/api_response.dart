import 'package:zstask/utils/enums/app_state.dart';

class ApiResponse<T> {
  AppState status;
  T data;
  String message;

  ApiResponse.loading(this.message) : status = AppState.LOADING;

  ApiResponse.completed(this.data) : status = AppState.DONE;

  ApiResponse.error(this.message) : status = AppState.ERROR;

  ApiResponse.idle() : status = AppState.IDLE;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';

class UserRegisterCyber extends ChangeNotifier {
  bool actionRegister = false;

  Future<void> registerUserCyber(
    BuildContext context,
    String taiKhoan,
    String matKhau,
    String email,
    String soDt,
    String maNhom,
    String hoTen,
  ) async {
    
    try {
      ApiResponse res = await ApiRequest.userRegisterCyber(
          taiKhoan, matKhau, email, soDt, maNhom, hoTen);
      if (res.result == true) {
        actionRegister = true;
        AppFounction.showCustomDialogRoute(context, 'Register Success', 'Sign in for the best experience', true, AppRoute.screenLogin);
      } else {
        AppFounction.showCustomDialogFail(context, "Register failed",
            "User or email is already in use. Please try again!");
      }

      notifyListeners();
    } catch (e) {
      AppFunction.hideLoading(context);
      print(e);
      print('Thất bại');
    }
  }
}

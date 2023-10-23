import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/model/film_model.dart';
import 'package:flutter_cinema_06/model/thong_tin_tai_khoan_cyber.dart';

import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';

class TicketCyber extends ChangeNotifier {
  final List<ThongTinDatVeTaiKhoan> _listThongTinDatVeTaiKhoan = [];
  List<ThongTinDatVeTaiKhoan> get listThongTinDatVeTaiKhoan =>
      _listThongTinDatVeTaiKhoan;
  final List<ThongTinUserCyber> _listThongTinUserCyber = [];
  List<ThongTinUserCyber> get listThongTinUserCyber => _listThongTinUserCyber;

  Future<void> getThongTinUserCyber(BuildContext context) async {
    AppFunction.showLoading(context);
    listThongTinUserCyber.clear();
    try {
      ApiResponse res = await ApiRequest.thongTinTaiKhoan();
      if (res.result == true) {
        AppFunction.hideLoading(context);
        ThongTinUserCyber data =
            ThongTinUserCyber.fromJson(res.data['content']);
        _listThongTinUserCyber.add(data);
      }
      notifyListeners();
    } catch (e) {
      AppFunction.hideLoading(context);
      print(e);
      print('Thất bại');
    }
  }

  Future<void> getThongTinTaiKhoan(BuildContext context) async {
    AppFunction.showLoading(context);
    listThongTinDatVeTaiKhoan.clear();
    try {
      ApiResponse res = await ApiRequest.thongTinTaiKhoan();
      if (res.result == true) {
        AppFunction.hideLoading(context);

        for (var item in res.data['content']['thongTinDatVe']) {
          ThongTinDatVeTaiKhoan data = ThongTinDatVeTaiKhoan.fromJson(item);
          _listThongTinDatVeTaiKhoan.add(data);
        }
      }

      notifyListeners();
    } catch (e) {
      AppFunction.hideLoading(context);
      print(e);
      print('Thất bại');
    }
  }
}

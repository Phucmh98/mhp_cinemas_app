import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/model/thong_tin_lich_chieu_cyber_model.dart';

import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';

class ThongTinLichChieuHeThongRapCyber extends ChangeNotifier {
  final List<ThongTinLichChieuHeThongRap> _listThongTinLichChieu = [];
  List<ThongTinLichChieuHeThongRap> get listThongTinLichChieu =>
      _listThongTinLichChieu;

  Future<void> getThongTinChieuHeThongRapAction(BuildContext context) async {
    AppFunction.showLoading(context);
    listThongTinLichChieu.clear();

    try {
      ApiResponse res = await ApiRequest.getThongTinLichChieuHeThongRapCyber();
      if (res.result == true) {
        AppFunction.hideLoading(context);

        // Assuming 'content' is a list of JSON objects
        List<dynamic> content = res.data['content'];

        // Convert the JSON objects to ThongTinLichChieuHeThongRap objects and add them to the list
        _listThongTinLichChieu.addAll(
          content
              .map((json) => ThongTinLichChieuHeThongRap.fromJson(json))
              .toList(),
        );
      }

      print('thành công');

      notifyListeners();
    } catch (e) {
      // Xử lý lỗi khi tải dữ liệu từ API
      AppFunction.hideLoading(context);
      print('Lỗi tải dữ liệu từ API');
      print(e);
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/model/danh_sach_phong_ve_cyber.dart';



import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';

class CheckoutCyber extends ChangeNotifier {
  List<Map<String, dynamic>> danhSachVe = [];
  List<String> seatSelectingList = [];

  final List<ThongTinPhim?> _listThongTinPhim = [];
  List<ThongTinPhim?> get listThongTinPhim => _listThongTinPhim;

  final List<DanhSachGheCyber?> _listDanhSachGheCyber = [];
  List<DanhSachGheCyber?> get listDanhSachGhe => _listDanhSachGheCyber;

  String title = 'Error404';
  String description = 'Error404';
  String imgMobile = 'https://source.unsplash.com/random';

  Future<void> getThongTinPhimCyber(
      BuildContext context, String? maLichChieu) async {
    AppFunction.showLoading(context);
    listThongTinPhim.clear();
    listDanhSachGhe.clear();

    try {
      ApiResponse res = await ApiRequest.getDanhSachPhongVe(maLichChieu!);
      if (res.result == true) {
        final dynamic thongTinPhimData = res.data['content']['thongTinPhim'];
        if (thongTinPhimData != null) {
          if (thongTinPhimData is Map<String, dynamic>) {
            final thongTinPhim = ThongTinPhim.fromJson(thongTinPhimData);
            _listThongTinPhim.add(thongTinPhim);
          }
        }
        for (int i = 0; i < res.data['content']['danhSachGhe'].length; i++) {
          DanhSachGheCyber ghe =
              DanhSachGheCyber.fromJson(res.data['content']['danhSachGhe'][i]);
          _listDanhSachGheCyber.add(ghe);
        }
      }

      notifyListeners();
    } catch (e) {
      // Xử lý lỗi khi tải dữ liệu từ API
      AppFunction.hideLoading(context);
      print('Lỗi tải dữ liệu từ API: $e');
    }
  }

  // Future<void> datVeActionCyber(BuildContext context, String? maLichChieu,
  //     List<Map<String, dynamic>> danhSachVe) async {
  //       print("Vào");
  //       AppFunction.showLoading(context);
  //   try {
  //     ApiResponse res = await ApiRequest.datVeCyber(maLichChieu!, danhSachVe);
  //     if (res.result == true) {
  //       print('thành công');
  //       AppFunction.hideLoading(context);
  //     }
  //   } catch (err) {
  //     AppFunction.hideLoading(context);
  //     print(err);
  //     print('lỗi r');
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/model/movie_detail_cyber.dart';
import 'package:flutter_cinema_06/model/thongTinRap_cyber.dart';
import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';

class DataMovieDetailCyberProvider extends ChangeNotifier {
  final List<DetailMovieCyber> _dataMovieDetail = [];
  final List<HeThongRapChieu> _dataHeThongRap = [];

  List<DetailMovieCyber> get dataMovieDetail => _dataMovieDetail;
  List<HeThongRapChieu> get dataHeThongRap => _dataHeThongRap;

  Future<void> getDataDetailMovieCyber(
      BuildContext context, String? idFilm) async {
    dataMovieDetail.clear();
    AppFunction.showLoading(context);

    ApiResponse res = await ApiRequest.getThongTinMovieCyber(idFilm!);
    _dataMovieDetail.clear();

    if (res.result == true) {
      AppFunction.hideLoading(context);
      DetailMovieCyber film = DetailMovieCyber.fromJson(res.data['content']);
      _dataMovieDetail.add(film);

      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      print("DataMovieProvider Đang bị lỗi");
      notifyListeners();
    }
  }

  Future<void> getDataRapCyber(BuildContext context, String? idFilm) async {
    dataHeThongRap.clear();
    AppFunction.showLoading(context);
    try {
      ApiResponse res = await ApiRequest.getThongTinRapCyber(idFilm!);

      if (res.result == true) {
        AppFunction.hideLoading(context);
        // print('thành công');
        List<dynamic> heThongRapChieuData =
            res.data['content']['heThongRapChieu'];
        for (var rapChieuData in heThongRapChieuData) {
          HeThongRapChieu rapChieu = HeThongRapChieu.fromJson(rapChieuData);
          _dataHeThongRap.add(rapChieu);
        }
      }
      notifyListeners();
    } catch (err) {
      AppFunction.hideLoading(context);
      print("dataHeThongRap Đang bị lỗi");
      print(err);
    }
  }
}

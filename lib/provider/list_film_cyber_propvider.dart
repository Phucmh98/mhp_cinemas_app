import 'package:flutter/material.dart';

import 'package:flutter_cinema_06/model/list_film_cyber.dart';

import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';

class DataMovieCyberProvider extends ChangeNotifier {
  final List<ListFilm> _listDataFilm = [];
  List<ListFilm> get listDataFilm => _listDataFilm;


  Future<void> getDataFilmCyber(BuildContext context, String maNhom, String tenPhim) async {
    listDataFilm.clear();
    AppFunction.showLoading(context);
    // print(res.data['content']);

    ApiResponse res = await ApiRequest.getMovieFormMaNhom(maNhom,tenPhim);

    if (res.result == true) {
      AppFunction.hideLoading(context);
      // print('Đây để kiểm lại content in cái j');
      for (int i = 0; i < res.data['content'].length; i++) {
        ListFilm film = ListFilm.fromJson(res.data['content'][i]);
        _listDataFilm.add(film);
      }
      notifyListeners();
    } else {
      AppFunction.hideLoading(context);
      print('Lỗi');
    }
  }
}

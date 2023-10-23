import 'dart:convert';

import 'apibase/api_client.dart';
import 'apibase/api_response.dart';

class ApiRequest {
  static const String _domain = "http://66.42.54.109:8010/api/cinemas";
  static const String _domainCyber = "https://movieapi.cyberlearn.vn/api";

  static Future<ApiResponse> userLogin(String passWord, String phone) async {
    Map data = {
      "phoneNumber": phone,
      "password": passWord,
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/auth/login",
      data: json.encode(data),
    );
  }

  //Màn Resister Phúc
  static Future<ApiResponse> registerUser(
      String name,
      String userName,
      String phoneNumber,
      String email,
      String imageUrl,
      String password) async {
    Map data = {
      "name": name,
      "userName": userName,
      "phoneNumber": phoneNumber,
      "email": email,
      "imageUrl": imageUrl,
      "roles": [],
      "password": password
    };

    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/admin/users",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> getDataMovie(String? value) async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: value == null
          ? "$_domain/backend/films?perPage=100"
          : "$_domain/backend/films?title=$value&perPage=100",
    );
  }

  static Future<ApiResponse> getBanner() async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: "$_domain/backend/news",
    );
  }

  static Future<ApiResponse> getMovieGenre(String title) async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: "$_domain/backend/films?category=$title&perPage=100",
    );
  }

  static Future<ApiResponse> selectSeatFromId(String idFilm) async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: "$_domain/backend/reservations/$idFilm",
    );
  }

  static Future<ApiResponse> activeSeats(
      String idFilm, List<String> idChair) async {
    Map data = {
      "filmId": idFilm,
      "chairIds": idChair,
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domain/backend/reservations",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> getMovieFormID(String idFilm) async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: "$_domain/backend/films/${idFilm}",
    );
  }

  //Api của MHP Cinimas
  static Future<ApiResponse> userLoginCyber(
      String taiKhoan, String matKhau) async {
    Map data = {
      "taiKhoan": taiKhoan,
      "matKhau": matKhau,
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domainCyber/QuanLyNguoiDung/DangNhap",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> userRegisterCyber(
    String taiKhoan,
    String matKhau,
    String email,
    String soDt,
    String maNhom,
    String hoTen,
  ) async {
    Map data = {
      "taiKhoan": taiKhoan,
      "matKhau": matKhau,
      "email": email,
      "soDt": soDt,
      "maNhom": maNhom,
      "hoTen": hoTen
    };
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domainCyber/QuanLyNguoiDung/DangKy",
      data: json.encode(data),
    );
  }
  static Future<ApiResponse> userUpgradeCyber(
    String taiKhoan,
    String matKhau,
    String email,
    String soDt,
    String maNhom,
    String maLoaiNguoiDung,
    String hoTen,
  ) async {
    Map data = {
      "taiKhoan": taiKhoan,
      "matKhau": matKhau,
      "email": email,
      "soDt": soDt,
      "maNhom": maNhom,
      "maLoaiNguoiDung": maLoaiNguoiDung,
      "hoTen": hoTen
    };
    return await ApiClient().request(
      method: ApiClient.PUT,
      url: "$_domainCyber/QuanLyNguoiDung/CapNhatThongTinNguoiDung",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> getMovieFormMaNhom(
      String maNhom, String? tenPhim) async {
    return await ApiClient().request(
      method: ApiClient.GET,
      url: tenPhim == ''
          ? "$_domainCyber/QuanLyPhim/LayDanhSachPhim?maNhom=$maNhom"
          : "$_domainCyber/QuanLyPhim/LayDanhSachPhim?maNhom=$maNhom&tenPhim=${tenPhim}",
    );
  }

  static Future<ApiResponse> getDataMovieCyber(String? maNhom) async {
    return await ApiClient().request(
        method: ApiClient.GET,
        url: "$_domainCyber/QuanLyPhim/LayDanhSachPhim?maNhom=$maNhom");
  }

  static Future<ApiResponse> getThongTinMovieCyber(String? maPhim) async {
    return await ApiClient().request(
        method: ApiClient.GET,
        url: "$_domainCyber/QuanLyPhim/LayThongTinPhim?MaPhim=$maPhim");
  }

  static Future<ApiResponse> getThongTinRapCyber(String? maPhim) async {
    return await ApiClient().request(
        method: ApiClient.GET,
        url: "$_domainCyber/QuanLyRap/LayThongTinLichChieuPhim?MaPhim=$maPhim");
  }

  static Future<ApiResponse> getDanhSachPhongVe(String? maLichChieu) async {
    return await ApiClient().request(
        method: ApiClient.GET,
        url:
            "$_domainCyber/QuanLyDatVe/LayDanhSachPhongVe?MaLichChieu=$maLichChieu");
  }

  static Future<ApiResponse> datVeCyber(
      String maLichChieu, List<Map<String, dynamic>> danhSachVe) async {
    Map data = {"maLichChieu": maLichChieu, "danhSachVe": danhSachVe};
    return await ApiClient().request(
      method: ApiClient.POST,
      url: "$_domainCyber/QuanLyDatVe/DatVe",
      data: json.encode(data),
    );
  }

  static Future<ApiResponse> thongTinTaiKhoan() async {
    return await ApiClient().request(
        method: ApiClient.POST,
        url: "$_domainCyber/QuanLyNguoiDung/ThongTinTaiKhoan");
  }

  static Future<ApiResponse> getThongTinLichChieuHeThongRapCyber() async {
    return await ApiClient().request(
        method: ApiClient.GET,
        url:
            "$_domainCyber/QuanLyRap/LayThongTinLichChieuHeThongRap?maNhom=GP00");
  }
}

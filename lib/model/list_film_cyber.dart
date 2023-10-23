class ListFilm {
  int? maPhim;
  String? tenPhim;
  String? biDanh;
  String? trailer;
  String? hinhAnh;
  String? moTa;
  String? maNhom;
  String? ngayKhoiChieu;
  int? danhGia;
  bool? hot;
  bool? dangChieu;
  bool? sapChieu;

  ListFilm(
      {this.maPhim,
      this.tenPhim,
      this.biDanh,
      this.trailer,
      this.hinhAnh,
      this.moTa,
      this.maNhom,
      this.ngayKhoiChieu,
      this.danhGia,
      this.hot,
      this.dangChieu,
      this.sapChieu});

  ListFilm.fromJson(Map<String, dynamic> json) {
    maPhim = json['maPhim'];
    tenPhim = json['tenPhim'];
    biDanh = json['biDanh'];
    trailer = json['trailer'];
    hinhAnh = json['hinhAnh'];
    moTa = json['moTa'];
    maNhom = json['maNhom'];
    ngayKhoiChieu = json['ngayKhoiChieu'];
    danhGia = json['danhGia'];
    hot = json['hot'];
    dangChieu = json['dangChieu'];
    sapChieu = json['sapChieu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maPhim'] = this.maPhim;
    data['tenPhim'] = this.tenPhim;
    data['biDanh'] = this.biDanh;
    data['trailer'] = this.trailer;
    data['hinhAnh'] = this.hinhAnh;
    data['moTa'] = this.moTa;
    data['maNhom'] = this.maNhom;
    data['ngayKhoiChieu'] = this.ngayKhoiChieu;
    data['danhGia'] = this.danhGia;
    data['hot'] = this.hot;
    data['dangChieu'] = this.dangChieu;
    data['sapChieu'] = this.sapChieu;
    return data;
  }
}

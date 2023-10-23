class DetailMovieCyber {
  int? maPhim;
  String? tenPhim;
  String? biDanh;
  String? trailer;
  String? hinhAnh;
  String? moTa;
  String? maNhom;
  bool? hot;
  bool? dangChieu;
  bool? sapChieu;
  String? ngayKhoiChieu;
  int? danhGia;

  DetailMovieCyber(
      {this.maPhim,
      this.tenPhim,
      this.biDanh,
      this.trailer,
      this.hinhAnh,
      this.moTa,
      this.maNhom,
      this.hot,
      this.dangChieu,
      this.sapChieu,
      this.ngayKhoiChieu,
      this.danhGia});

  DetailMovieCyber.fromJson(Map<String, dynamic> json) {
    maPhim = json['maPhim'];
    tenPhim = json['tenPhim'];
    biDanh = json['biDanh'];
    trailer = json['trailer'];
    hinhAnh = json['hinhAnh'];
    moTa = json['moTa'];
    maNhom = json['maNhom'];
    hot = json['hot'];
    dangChieu = json['dangChieu'];
    sapChieu = json['sapChieu'];
    ngayKhoiChieu = json['ngayKhoiChieu'];
    danhGia = json['danhGia'];
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
    data['hot'] = this.hot;
    data['dangChieu'] = this.dangChieu;
    data['sapChieu'] = this.sapChieu;
    data['ngayKhoiChieu'] = this.ngayKhoiChieu;
    data['danhGia'] = this.danhGia;
    return data;
  }
}

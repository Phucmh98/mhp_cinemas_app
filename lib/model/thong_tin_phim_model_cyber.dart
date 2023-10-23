class ThongTinPhimCyber {
  int? maLichChieu;
  String? tenCumRap;
  String? tenRap;
  String? diaChi;
  String? tenPhim;
  String? hinhAnh;
  String? ngayChieu;
  String? gioChieu;

  ThongTinPhimCyber(
      {this.maLichChieu,
      this.tenCumRap,
      this.tenRap,
      this.diaChi,
      this.tenPhim,
      this.hinhAnh,
      this.ngayChieu,
      this.gioChieu});

  ThongTinPhimCyber.fromJson(Map<String, dynamic> json) {
    maLichChieu = json['maLichChieu'];
    tenCumRap = json['tenCumRap'];
    tenRap = json['tenRap'];
    diaChi = json['diaChi'];
    tenPhim = json['tenPhim'];
    hinhAnh = json['hinhAnh'];
    ngayChieu = json['ngayChieu'];
    gioChieu = json['gioChieu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maLichChieu'] = this.maLichChieu;
    data['tenCumRap'] = this.tenCumRap;
    data['tenRap'] = this.tenRap;
    data['diaChi'] = this.diaChi;
    data['tenPhim'] = this.tenPhim;
    data['hinhAnh'] = this.hinhAnh;
    data['ngayChieu'] = this.ngayChieu;
    data['gioChieu'] = this.gioChieu;
    return data;
  }
}

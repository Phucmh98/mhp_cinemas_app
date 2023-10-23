class DanhSachPhongVe {
  ThongTinPhim? thongTinPhim;
  List<DanhSachGheCyber>? danhSachGhe;

  DanhSachPhongVe({this.thongTinPhim, this.danhSachGhe});

  DanhSachPhongVe.fromJson(Map<String, dynamic> json) {
    thongTinPhim = json['thongTinPhim'] != null
        ? new ThongTinPhim.fromJson(json['thongTinPhim'])
        : null;
    if (json['danhSachGhe'] != null) {
      danhSachGhe = <DanhSachGheCyber>[];
      json['danhSachGhe'].forEach((v) {
        danhSachGhe!.add(new DanhSachGheCyber.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thongTinPhim != null) {
      data['thongTinPhim'] = this.thongTinPhim!.toJson();
    }
    if (this.danhSachGhe != null) {
      data['danhSachGhe'] = this.danhSachGhe!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThongTinPhim {
  int? maLichChieu;
  String? tenCumRap;
  String? tenRap;
  String? diaChi;
  String? tenPhim;
  String? hinhAnh;
  String? ngayChieu;
  String? gioChieu;

  ThongTinPhim(
      {this.maLichChieu,
      this.tenCumRap,
      this.tenRap,
      this.diaChi,
      this.tenPhim,
      this.hinhAnh,
      this.ngayChieu,
      this.gioChieu});

  ThongTinPhim.fromJson(Map<String, dynamic> json) {
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

class DanhSachGheCyber {
  int? maGhe;
  String? tenGhe;
  int? maRap;
  String? loaiGhe;
  String? stt;
  double? giaVe;
  bool? daDat;
  String? taiKhoanNguoiDat;

  DanhSachGheCyber(
      {this.maGhe,
      this.tenGhe,
      this.maRap,
      this.loaiGhe,
      this.stt,
      this.giaVe,
      this.daDat,
      this.taiKhoanNguoiDat});

  DanhSachGheCyber.fromJson(Map<String, dynamic> json) {
    maGhe = json['maGhe'];
    tenGhe = json['tenGhe'];
    maRap = json['maRap'];
    loaiGhe = json['loaiGhe'];
    stt = json['stt'];
    giaVe = json['giaVe'];
    daDat = json['daDat'];
    taiKhoanNguoiDat = json['taiKhoanNguoiDat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maGhe'] = this.maGhe;
    data['tenGhe'] = this.tenGhe;
    data['maRap'] = this.maRap;
    data['loaiGhe'] = this.loaiGhe;
    data['stt'] = this.stt;
    data['giaVe'] = this.giaVe;
    data['daDat'] = this.daDat;
    data['taiKhoanNguoiDat'] = this.taiKhoanNguoiDat;
    return data;
  }
}

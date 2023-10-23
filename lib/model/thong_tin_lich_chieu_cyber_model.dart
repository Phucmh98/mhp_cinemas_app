class ThongTinLichChieuHeThongRap {
  List<LstCumRap>? lstCumRap;
  String? maHeThongRap;
  String? tenHeThongRap;
  String? logo;
  String? mahom;

  ThongTinLichChieuHeThongRap(
      {this.lstCumRap,
      this.maHeThongRap,
      this.tenHeThongRap,
      this.logo,
      this.mahom});

  ThongTinLichChieuHeThongRap.fromJson(Map<String, dynamic> json) {
    if (json['lstCumRap'] != null) {
      lstCumRap = <LstCumRap>[];
      json['lstCumRap'].forEach((v) {
        lstCumRap!.add(new LstCumRap.fromJson(v));
      });
    }
    maHeThongRap = json['maHeThongRap'];
    tenHeThongRap = json['tenHeThongRap'];
    logo = json['logo'];
    mahom = json['mahom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lstCumRap != null) {
      data['lstCumRap'] = this.lstCumRap!.map((v) => v.toJson()).toList();
    }
    data['maHeThongRap'] = this.maHeThongRap;
    data['tenHeThongRap'] = this.tenHeThongRap;
    data['logo'] = this.logo;
    data['mahom'] = this.mahom;
    return data;
  }
}

class LstCumRap {
  List<DanhSachPhim>? danhSachPhim;
  String? maCumRap;
  String? tenCumRap;
  String? hinhAnh;
  String? diaChi;

  LstCumRap(
      {this.danhSachPhim,
      this.maCumRap,
      this.tenCumRap,
      this.hinhAnh,
      this.diaChi});

  LstCumRap.fromJson(Map<String, dynamic> json) {
    if (json['danhSachPhim'] != null) {
      danhSachPhim = <DanhSachPhim>[];
      json['danhSachPhim'].forEach((v) {
        danhSachPhim!.add(new DanhSachPhim.fromJson(v));
      });
    }
    maCumRap = json['maCumRap'];
    tenCumRap = json['tenCumRap'];
    hinhAnh = json['hinhAnh'];
    diaChi = json['diaChi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.danhSachPhim != null) {
      data['danhSachPhim'] = this.danhSachPhim!.map((v) => v.toJson()).toList();
    }
    data['maCumRap'] = this.maCumRap;
    data['tenCumRap'] = this.tenCumRap;
    data['hinhAnh'] = this.hinhAnh;
    data['diaChi'] = this.diaChi;
    return data;
  }
}

class DanhSachPhim {
  List<LstLichChieuTheoPhim>? lstLichChieuTheoPhim;
  int? maPhim;
  String? tenPhim;
  String? hinhAnh;
  bool? hot;
  bool? dangChieu;
  bool? sapChieu;

  DanhSachPhim(
      {this.lstLichChieuTheoPhim,
      this.maPhim,
      this.tenPhim,
      this.hinhAnh,
      this.hot,
      this.dangChieu,
      this.sapChieu});

  DanhSachPhim.fromJson(Map<String, dynamic> json) {
    if (json['lstLichChieuTheoPhim'] != null) {
      lstLichChieuTheoPhim = <LstLichChieuTheoPhim>[];
      json['lstLichChieuTheoPhim'].forEach((v) {
        lstLichChieuTheoPhim!.add(new LstLichChieuTheoPhim.fromJson(v));
      });
    }
    maPhim = json['maPhim'];
    tenPhim = json['tenPhim'];
    hinhAnh = json['hinhAnh'];
    hot = json['hot'];
    dangChieu = json['dangChieu'];
    sapChieu = json['sapChieu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lstLichChieuTheoPhim != null) {
      data['lstLichChieuTheoPhim'] =
          this.lstLichChieuTheoPhim!.map((v) => v.toJson()).toList();
    }
    data['maPhim'] = this.maPhim;
    data['tenPhim'] = this.tenPhim;
    data['hinhAnh'] = this.hinhAnh;
    data['hot'] = this.hot;
    data['dangChieu'] = this.dangChieu;
    data['sapChieu'] = this.sapChieu;
    return data;
  }
}

class LstLichChieuTheoPhim {
  int? maLichChieu;
  String? maRap;
  String? tenRap;
  String? ngayChieuGioChieu;
  double? giaVe;

  LstLichChieuTheoPhim(
      {this.maLichChieu,
      this.maRap,
      this.tenRap,
      this.ngayChieuGioChieu,
      this.giaVe});

  LstLichChieuTheoPhim.fromJson(Map<String, dynamic> json) {
    maLichChieu = json['maLichChieu'];
    maRap = json['maRap'];
    tenRap = json['tenRap'];
    ngayChieuGioChieu = json['ngayChieuGioChieu'];
    giaVe = json['giaVe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maLichChieu'] = this.maLichChieu;
    data['maRap'] = this.maRap;
    data['tenRap'] = this.tenRap;
    data['ngayChieuGioChieu'] = this.ngayChieuGioChieu;
    data['giaVe'] = this.giaVe;
    return data;
  }
}

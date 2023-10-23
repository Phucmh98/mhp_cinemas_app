class HeThongRapChieu {
  List<CumRapChieu>? cumRapChieu;
  String? maHeThongRap;
  String? tenHeThongRap;
  String? logo;

  HeThongRapChieu(
      {this.cumRapChieu, this.maHeThongRap, this.tenHeThongRap, this.logo});

  HeThongRapChieu.fromJson(Map<String, dynamic> json) {
    if (json['cumRapChieu'] != null) {
      cumRapChieu = <CumRapChieu>[];
      json['cumRapChieu'].forEach((v) {
        cumRapChieu!.add(new CumRapChieu.fromJson(v));
      });
    }
    maHeThongRap = json['maHeThongRap'];
    tenHeThongRap = json['tenHeThongRap'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cumRapChieu != null) {
      data['cumRapChieu'] = this.cumRapChieu!.map((v) => v.toJson()).toList();
    }
    data['maHeThongRap'] = this.maHeThongRap;
    data['tenHeThongRap'] = this.tenHeThongRap;
    data['logo'] = this.logo;
    return data;
  }
}

class CumRapChieu {
  List<LichChieuPhim>? lichChieuPhim;
  String? maCumRap;
  String? tenCumRap;
  String? hinhAnh;
  String? diaChi;

  CumRapChieu(
      {this.lichChieuPhim,
      this.maCumRap,
      this.tenCumRap,
      this.hinhAnh,
      this.diaChi});

  CumRapChieu.fromJson(Map<String, dynamic> json) {
    if (json['lichChieuPhim'] != null) {
      lichChieuPhim = <LichChieuPhim>[];
      json['lichChieuPhim'].forEach((v) {
        lichChieuPhim!.add(new LichChieuPhim.fromJson(v));
      });
    }
    maCumRap = json['maCumRap'];
    tenCumRap = json['tenCumRap'];
    hinhAnh = json['hinhAnh'];
    diaChi = json['diaChi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lichChieuPhim != null) {
      data['lichChieuPhim'] =
          this.lichChieuPhim!.map((v) => v.toJson()).toList();
    }
    data['maCumRap'] = this.maCumRap;
    data['tenCumRap'] = this.tenCumRap;
    data['hinhAnh'] = this.hinhAnh;
    data['diaChi'] = this.diaChi;
    return data;
  }
}

class LichChieuPhim {
  String? maLichChieu;
  String? maRap;
  String? tenRap;
  String? ngayChieuGioChieu;
  double? giaVe;
  int? thoiLuong;

  LichChieuPhim(
      {this.maLichChieu,
      this.maRap,
      this.tenRap,
      this.ngayChieuGioChieu,
      this.giaVe,
      this.thoiLuong});

  LichChieuPhim.fromJson(Map<String, dynamic> json) {
    maLichChieu = json['maLichChieu'];
    maRap = json['maRap'];
    tenRap = json['tenRap'];
    ngayChieuGioChieu = json['ngayChieuGioChieu'];
    giaVe = json['giaVe'];
    thoiLuong = json['thoiLuong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maLichChieu'] = this.maLichChieu;
    data['maRap'] = this.maRap;
    data['tenRap'] = this.tenRap;
    data['ngayChieuGioChieu'] = this.ngayChieuGioChieu;
    data['giaVe'] = this.giaVe;
    data['thoiLuong'] = this.thoiLuong;
    return data;
  }
}

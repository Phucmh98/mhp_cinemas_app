class ThongTinDatVeTaiKhoan {
  List<DanhSachGheThongTinTaiKhoan>? danhSachGhe;
  int? maVe;
  String? ngayDat;
  String? tenPhim;
  String? hinhAnh;
  double? giaVe;
  int? thoiLuongPhim;

  ThongTinDatVeTaiKhoan(
      {this.danhSachGhe,
      this.maVe,
      this.ngayDat,
      this.tenPhim,
      this.hinhAnh,
      this.giaVe,
      this.thoiLuongPhim});

  ThongTinDatVeTaiKhoan.fromJson(Map<String, dynamic> json) {
    if (json['danhSachGhe'] != null) {
      danhSachGhe = <DanhSachGheThongTinTaiKhoan>[];
      json['danhSachGhe'].forEach((v) {
        danhSachGhe!.add(new DanhSachGheThongTinTaiKhoan.fromJson(v));
      });
    }
    maVe = json['maVe'];
    ngayDat = json['ngayDat'];
    tenPhim = json['tenPhim'];
    hinhAnh = json['hinhAnh'];
    giaVe = json['giaVe'];
    thoiLuongPhim = json['thoiLuongPhim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.danhSachGhe != null) {
      data['danhSachGhe'] = this.danhSachGhe!.map((v) => v.toJson()).toList();
    }
    data['maVe'] = this.maVe;
    data['ngayDat'] = this.ngayDat;
    data['tenPhim'] = this.tenPhim;
    data['hinhAnh'] = this.hinhAnh;
    data['giaVe'] = this.giaVe;
    data['thoiLuongPhim'] = this.thoiLuongPhim;
    return data;
  }
}

class DanhSachGheThongTinTaiKhoan {
  String? maHeThongRap;
  String? tenHeThongRap;
  String? maCumRap;
  String? tenCumRap;
  int? maRap;
  String? tenRap;
  int? maGhe;
  String? tenGhe;

  DanhSachGheThongTinTaiKhoan(
      {this.maHeThongRap,
      this.tenHeThongRap,
      this.maCumRap,
      this.tenCumRap,
      this.maRap,
      this.tenRap,
      this.maGhe,
      this.tenGhe});

  DanhSachGheThongTinTaiKhoan.fromJson(Map<String, dynamic> json) {
    maHeThongRap = json['maHeThongRap'];
    tenHeThongRap = json['tenHeThongRap'];
    maCumRap = json['maCumRap'];
    tenCumRap = json['tenCumRap'];
    maRap = json['maRap'];
    tenRap = json['tenRap'];
    maGhe = json['maGhe'];
    tenGhe = json['tenGhe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maHeThongRap'] = this.maHeThongRap;
    data['tenHeThongRap'] = this.tenHeThongRap;
    data['maCumRap'] = this.maCumRap;
    data['tenCumRap'] = this.tenCumRap;
    data['maRap'] = this.maRap;
    data['tenRap'] = this.tenRap;
    data['maGhe'] = this.maGhe;
    data['tenGhe'] = this.tenGhe;
    return data;
  }
}

class ThongTinUserCyber {
  String? taiKhoan;
  String? matKhau;
  String? hoTen;
  String? email;
  String? soDT;
  String? maNhom;
  String? loaiNguoiDung;

  ThongTinUserCyber({
    this.taiKhoan,
    this.matKhau,
    this.hoTen,
    this.email,
    this.soDT,
    this.maNhom,
    this.loaiNguoiDung,
  });

  ThongTinUserCyber.fromJson(Map<String, dynamic> json) {
    taiKhoan = json['taiKhoan'];
    matKhau = json['matKhau'];
    hoTen = json['hoTen'];
    email = json['email'];
    soDT = json['soDT'];
    maNhom = json['maNhom'];
    loaiNguoiDung = json['loaiNguoiDung'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['taiKhoan'] = taiKhoan;
    data['matKhau'] = matKhau;
    data['hoTen'] = hoTen;
    data['email'] = email;
    data['soDT'] = soDT;
    data['maNhom'] = maNhom;
    data['loaiNguoiDung'] = loaiNguoiDung;
    return data;
  }
}

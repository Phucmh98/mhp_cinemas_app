class RegisterCyber {
  String? taiKhoan;
  String? matKhau;
  String? email;
  String? soDt;
  String? maNhom;
  String? hoTen;

  RegisterCyber(
      {this.taiKhoan,
      this.matKhau,
      this.email,
      this.soDt,
      this.maNhom,
      this.hoTen});

  RegisterCyber.fromJson(Map<String, dynamic> json) {
    taiKhoan = json['taiKhoan'];
    matKhau = json['matKhau'];
    email = json['email'];
    soDt = json['soDt'];
    maNhom = json['maNhom'];
    hoTen = json['hoTen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taiKhoan'] = this.taiKhoan;
    data['matKhau'] = this.matKhau;
    data['email'] = this.email;
    data['soDt'] = this.soDt;
    data['maNhom'] = this.maNhom;
    data['hoTen'] = this.hoTen;
    return data;
  }
}

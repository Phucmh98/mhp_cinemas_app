import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/thong_tin_tai_khoan_cyber.dart';
import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/provider/ticket_provider_cyber.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';
import 'package:flutter_cinema_06/widgets/custom_button.dart';
import 'package:flutter_cinema_06/widgets/textfiled_tu.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

//regext kiêm tra email
bool isValidEmail(String email) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

String convertToCamelCase(String input) {
  if (input == 'Khách Hàng') {
    return 'KhachHang';
  } else {
    return 'QuanTri';
  }
}

class Acountscreen2 extends StatefulWidget {
  const Acountscreen2({super.key});

  @override
  State<Acountscreen2> createState() => _Acountscreen2();
}

class _Acountscreen2 extends State<Acountscreen2> {
  TextEditingController controller1 = TextEditingController();
  File? _image;
  String? phone;
  String? password;
  String? maNhom;
  String? loaiNguoiDung;

  TextEditingController userLogin = new TextEditingController();
  TextEditingController userPassword = new TextEditingController();
  TextEditingController userPasswordConfirm = new TextEditingController();
  TextEditingController userEmail = new TextEditingController();
  TextEditingController usersoDT = new TextEditingController();
  TextEditingController userName = new TextEditingController();
  List<ThongTinUserCyber> dataThongTinTaiKhoan = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    TicketCyber dataProfie = Provider.of<TicketCyber>(context, listen: false);
    dataThongTinTaiKhoan = dataProfie.listThongTinUserCyber;
    userLogin.text = dataThongTinTaiKhoan[0].taiKhoan!;
    userEmail.text = dataThongTinTaiKhoan[0].email!;
    usersoDT.text = dataThongTinTaiKhoan[0].soDT!;
    userName.text = dataThongTinTaiKhoan[0].hoTen!;
    maNhom = dataThongTinTaiKhoan[0].maNhom!;
    loaiNguoiDung = convertToCamelCase(dataThongTinTaiKhoan[0].loaiNguoiDung!);
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff130B2B),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: (
                    
                  ) {Navigator.pop(context);},
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF60FFCA),
                          Color(0xFF453E59),
                          Color(0xFF453E59),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF453E59),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                )),
                const Expanded(
                  flex: 5,
                  child: Text(
                    "Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  ),
                ),
                
                Expanded(
                  child: Container(
                    
                    width: 40,
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF60FFCA),
                            Color(0xFF453E59),
                            Color(0xFF453E59),
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF453E59),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () async {
                final images =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (images != null) {
                  final anh = File(images.path);
                  _image = anh;
                  setState() {}
                }
              },
              child: _image != null
                  ? CircleAvatar(radius: 30, child: Image.file(_image!))
                  : Image.asset(
                      AppImages.profile_avata,
                      width: width * 0.51,
                      height: width * 0.49,
                    ),
            ),
            const SizedBox(
              height: 27,
            ),
            TextFormFile(hint: "User", controller: userLogin),
            const SizedBox(
              height: 20,
            ),
            TextFormFile(
              hint: "Password",
              controller: userPassword,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFile(
              hint: "Password Confirm",
              controller: userPasswordConfirm,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFile(
              hint: "Email",
              controller: userEmail,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFile(
              hint: "Phone Number",
              controller: usersoDT,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFile(hint: "Name", controller: userName),
            const SizedBox(
              height: 36,
            ),
            GestureDetector(
              child: CustomButton(
                width: width - 50,
                height: 50,
                backgroundColor1: const Color.fromARGB(255, 252, 210, 55),
                backgroundColor2: const Color.fromARGB(255, 221, 89, 18),
                borderColor1: const Color.fromARGB(255, 252, 210, 55),
                borderColor2: const Color.fromARGB(255, 221, 90, 18),
                text: "Save",
                textColor: Colors.white,
              ),
              onTap: () async {
                if (userLogin.text.isEmpty ||
                    userPassword.text.isEmpty ||
                    userPasswordConfirm.text.isEmpty ||
                    userName.text.isEmpty ||
                    userEmail.text.isEmpty ||
                    usersoDT.text.isEmpty ||
                    isValidEmail(userEmail.text) == false) {
                  AppFounction.showCustomDialogFail(
                      context,
                      'Create Account Fail',
                      'Please check your Email or Phone Number');
                } else {
                  print(loaiNguoiDung);
                  ApiResponse res = await ApiRequest.userUpgradeCyber(
                      userLogin.text,
                      userPassword.text,
                      userEmail.text,
                      usersoDT.text,
                      maNhom!,
                      loaiNguoiDung!,
                      userName.text);
                  if (res.result == true) {
                    await Navigator.pushReplacementNamed(
                        context, AppRoute.dashBroard);
                    AppFounction.showCustomDialogRoute(
                        context,
                        "Upgrade Success",
                        "We will return you to the Home screen",
                        true,
                        AppRoute.dashBroard);
                  } else {
                    AppFounction.showCustomDialogFail(context, 'upgrade Fail',
                        'Something wrong. Please check your information!');
                  }
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        )),
      ),
    );
  }
}

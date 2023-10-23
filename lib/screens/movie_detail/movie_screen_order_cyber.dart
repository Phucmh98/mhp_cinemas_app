import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/danh_sach_phong_ve_cyber.dart';
import 'package:flutter_cinema_06/provider/check_out_cyber_provider.dart';

import 'package:intl/intl.dart';

import 'package:flutter_cinema_06/widgets/custom_button.dart';

import 'package:flutter_cinema_06/widgets/wiget_img_text.dart';

import 'package:provider/provider.dart';

List<Map<String, dynamic>> gheThuong = [];
List<Map<String, dynamic>> gheVip = [];

List<Map<String, dynamic>> danhSachVe = [];
List<String> seatSelectingList = [];
List<String> firstCharacters = [];
List<String> chairIDList = [];
List<dynamic> priceList = [];
var sumPrice = 0;

//Hàm tính tổng tiền
int calculateTotal(List<dynamic> priceList) {
  var total = 0;
  if (priceList.length == 0) {
    return total;
  } else {
    total = priceList.reduce((value, element) => value + element);
    return total;
  }
}

String convertListToText(List<String> numbers) {
  return numbers.map((number) => number.toString()).join(', ');
}

List<String> getSttListByLoaiGhe(
    List<Map<String, dynamic>> danhSachVe, String loaiGhe) {
  List<Map<String, dynamic>> gheFiltered =
      danhSachVe.where((ghe) => ghe["loaiGhe"] == loaiGhe).toList();
  return gheFiltered.map((ghe) => ghe["stt"].toString()).toList();
}

double tinhTongTienLoaiGhe(
    List<Map<String, dynamic>> danhSachGhe, String loaiGhe) {
  double tongTien = 0.0;

  for (var ghe in danhSachGhe) {
    if (ghe["loaiGhe"] == loaiGhe) {
      tongTien += ghe["giaVe"];
    }
  }

  return tongTien;
}

class MovieScreenOrderCyber extends StatefulWidget {
  const MovieScreenOrderCyber({super.key});
  @override
  State<MovieScreenOrderCyber> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MovieScreenOrderCyber> {
  String seatStext = '0';
  double total = 0;
  double totalGheThuong = 0;
  double totalGheVip = 0;

  List<ThongTinPhim?> danhSachThongTin = [];

  @override
  void initState() {
    super.initState();
    CheckoutCyber checkout = Provider.of<CheckoutCyber>(context, listen: false);

    seatSelectingList = checkout.seatSelectingList;
    danhSachVe = checkout.danhSachVe;
    danhSachThongTin = checkout.listThongTinPhim;
    seatStext = convertListToText(seatSelectingList);

    for (var ghe in danhSachVe) {
      if (ghe["loaiGhe"] == "Thuong") {
        gheThuong.add(ghe);
      } else if (ghe["loaiGhe"] == "Vip") {
        gheVip.add(ghe);
      }
    }
    totalGheThuong = tinhTongTienLoaiGhe(danhSachVe, 'Thuong');
    totalGheVip = tinhTongTienLoaiGhe(danhSachVe, 'Vip');
    total = totalGheThuong + totalGheVip;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print(seatSelectingList);
    print(danhSachThongTin);
    print(totalGheThuong);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 20, 91),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          width: width,
                          height: 4 / 3 * width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  const Color(0xFF130B2B).withOpacity(0.7),
                                  BlendMode.darken),
                              image: NetworkImage(
                                '${danhSachThongTin[0]?.hinhAnh}',
                              ),
                              fit: BoxFit.cover
                                  , // Sử dụng thuộc tính fit trong DecorationImage
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 130, left: 15, right: 15),
                            alignment: Alignment.bottomCenter,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${danhSachThongTin[0]?.tenPhim}',
                                    style: const TextStyle(
                                      color: Color(0xFFECECEC),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color.fromARGB(
                                              255, 204, 136, 47)
                                          .withOpacity(0.7),
                                    ),
                                    width: 275,
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        WidgetImgText(
                                          img: AppImages.ic_location_order,
                                          text: '${danhSachThongTin[0]?.tenRap}'
                                              .toUpperCase(),
                                        ),
                                        WidgetImgText(
                                          img: AppImages.ic_location_order,
                                          text:
                                              '${danhSachThongTin[0]?.diaChi}',
                                        ),
                                        WidgetImgText(
                                          img: AppImages.ic_calendar_order,
                                          text:
                                              '${danhSachThongTin[0]?.ngayChieu} | ${danhSachThongTin[0]?.gioChieu}',
                                        ),
                                        WidgetImgText(
                                          img: AppImages.ic_seat_order,
                                          text:
                                              '${seatSelectingList.length} Seats selected',
                                        ),
                                        WidgetImgText(
                                          img: AppImages.ic_ticket_order,
                                          text: 'Seat ${seatStext}',
                                        ),
                                        const WidgetImgText(
                                          img: AppImages.ic_clock_order,
                                          text: '120m',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price Details',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.65)),
                              ),
                              Icon(
                                Icons.keyboard_arrow_up_sharp,
                                color: Colors.white.withOpacity(0.65),
                                size: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Ticket Subtotal',
                              style: TextStyle(
                                color: Colors.white,
                                height: 2.5,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Normal tickets: ',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '| ${NumberFormat("#,##0", "vi_VN").format(totalGheThuong)} VNĐ',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '- ${convertListToText(getSttListByLoaiGhe(danhSachVe, "Thuong"))}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 2),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'VIP tickets:',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '| ${NumberFormat("#,##0", "vi_VN").format(totalGheVip)} VNĐ',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 2),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '- ${convertListToText(getSttListByLoaiGhe(danhSachVe, "Vip"))}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${NumberFormat("#,##0", "vi_VN").format(total)} VNĐ',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoute.paymentScreenCyber);
                            },
                            child: CustomButton(
                              text: 'Proceed to Payment',
                              width: width,
                              height: 50,
                              textColor: Colors.white,
                              backgroundColor1:
                                  const Color.fromARGB(255, 252, 210, 55),
                              backgroundColor2:
                                  const Color.fromARGB(255, 221, 90, 18),
                              borderColor1:
                                  const Color.fromARGB(255, 252, 210, 55),
                              borderColor2:
                                  const Color.fromARGB(255, 221, 90, 18),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
              child: WillPopScope(
                onWillPop: () async {
                  Navigator.pop(context);
                  danhSachVe.clear();
                  return true; // Trả về true để cho phép đóng màn hình
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            danhSachVe.clear();
                          },
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
                            "PVR Cinemas",
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
                    const Text(
                      'Order Summary',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_cinema_06/model/thong_tin_tai_khoan_cyber.dart';
import 'package:flutter_cinema_06/provider/ticket_provider_cyber.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';
import 'package:flutter_cinema_06/widgets/widget_ticket_cyber.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

List<ThongTinDatVeTaiKhoan> thongTinTaiKhoan = [];
List<Widget> listWidgeTicket = [];

String convertListToText(List<String> text) {
  return text.map((text) => text.toString()).join(', ');
}

void addListTicket(
    List<ThongTinDatVeTaiKhoan> listThongTin, List<Widget> listWidget) {
  for (int i = 0; i < listThongTin.length; i++) {
    List<String> tempListString = [];
    String? urlImg = listThongTin[i].hinhAnh;
    String? tenPhim = listThongTin[i].tenPhim;
    String? diaChi = listThongTin[i].danhSachGhe?[0].tenHeThongRap;
    String? rap = listThongTin[i].danhSachGhe?[0].tenRap;
    String? ngayChieu = listThongTin[i].ngayDat;
    List<DanhSachGheThongTinTaiKhoan>? listGhe = listThongTin[i].danhSachGhe;
    for (int j = 0; j < listGhe!.length; j++) {
      tempListString.add(listGhe[j].tenGhe!);
    }
    // print(tempListString);
    WidgetTicketCyber widgetTicket = WidgetTicketCyber(
      urlImg: urlImg!,
      tenPhim: tenPhim!,
      diaChi: diaChi!,
      ngayChieu: DateFormat('dd/MM/yyyy').format(DateTime.parse(ngayChieu!)),
      gioChieu: DateFormat('hh:mm a').format(DateTime.parse(ngayChieu)),
      rap: rap!,
      tenGhe: convertListToText(tempListString),
    );
    listWidget.add(widgetTicket);
  }
}

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  void initState() {
    super.initState();
    loadThongTinTaiKhoan();
    listWidgeTicket.clear();
  }

  Future<void> loadThongTinTaiKhoan() async {
    await AppFunction.showLoading(context);
    TicketCyber ticketCyber = Provider.of<TicketCyber>(context, listen: false);
    await ticketCyber.getThongTinTaiKhoan(context);
    thongTinTaiKhoan = ticketCyber.listThongTinDatVeTaiKhoan;
    addListTicket(thongTinTaiKhoan, listWidgeTicket);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print('thongTinTaiKhoan');
    // print(thongTinTaiKhoan);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF170641),
                  Color(0xFF2E1371),
                  Color(0xFF00021B),
                ],
                stops: [0.2, 0.35, 1],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {},
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
                            "MHP Cinemas",
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
                  ],
                ),
                const Text(
                  'Your tickets',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 580,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: listWidgeTicket.map((widget) {
                              return Container(
                                width: 280,
                                padding: const EdgeInsets.all(5),
                                child: widget,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                const SizedBox(
                  height: 65,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

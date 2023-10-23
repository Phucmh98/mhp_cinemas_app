import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/thong_tin_lich_chieu_cyber_model.dart';
import 'package:flutter_cinema_06/provider/check_out_cyber_provider.dart';
import 'package:flutter_cinema_06/provider/data_movie_provider_cyber.dart';
import 'package:flutter_cinema_06/provider/thong_tin_lich_chieu_provider_cyber.dart';

import 'package:flutter_cinema_06/utils/app_function.dart';
import 'package:flutter_cinema_06/widgets/custom_button_select_cyber.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

List<ThongTinLichChieuHeThongRap> dataThongTinHeThong = [];

class _CategoryScreenState extends State<CategoryScreen> {
  Future<void> loadThongTinLichChieuHeThongRap() async {
    await AppFunction.showLoading(context);
    ThongTinLichChieuHeThongRapCyber dataThongTin =
        Provider.of<ThongTinLichChieuHeThongRapCyber>(context, listen: false);

    await dataThongTin.getThongTinChieuHeThongRapAction(context);
    dataThongTinHeThong = dataThongTin.listThongTinLichChieu;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadThongTinLichChieuHeThongRap();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
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
                  'Choose your Cinema',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: dataThongTinHeThong.length,
                    child: Column(
                      children: <Widget>[
                        ButtonsTabBar(
                          height: 120,
                          backgroundColor: Color.fromARGB(255, 233, 169, 51),
                          unselectedBackgroundColor:
                              const Color.fromARGB(255, 15, 9, 34),
                          radius: 0,
                          buttonMargin: const EdgeInsets.all(0),
                          contentPadding: const EdgeInsets.only(top: 10),
                          unselectedLabelStyle:
                              const TextStyle(color: Colors.black),
                          tabs: [
                            ...dataThongTinHeThong.map((thongTin) {
                              return Tab(
                                child: Container(
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        '${thongTin.logo}',
                                        height: 50,
                                        width: 50,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${thongTin.tenHeThongRap}'
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList()
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              for (var thongTin in dataThongTinHeThong)
                                Container(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: (thongTin.lstCumRap ?? [])
                                        .map((cumRap) {
                                      return Container(
                                          color: const Color.fromARGB(
                                              255, 15, 9, 34),
                                          width: double.infinity,
                                          margin:
                                              const EdgeInsets.only(bottom: 5),
                                          child: ExpansionWidget(
                                              initiallyExpanded: false,
                                              titleBuilder:
                                                  (double animationValue,
                                                      _,
                                                      bool isExpaned,
                                                      toogleFunction) {
                                                return InkWell(
                                                    onTap: () => toogleFunction(
                                                        animated: true),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.network(
                                                            '${thongTin.logo}',
                                                            width: 50,
                                                            height: 50,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            '${cumRap.tenCumRap}',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )),
                                                          Transform.rotate(
                                                            angle: math.pi *
                                                                animationValue /
                                                                2,
                                                            child: Icon(
                                                              Icons.arrow_right,
                                                              size: 40,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                          )
                                                        ],
                                                      ),
                                                    ));
                                              },
                                              content: SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                    children:
                                                        (cumRap.danhSachPhim ??
                                                                [])
                                                            .take(12)
                                                            .map((phim) {
                                                  return Container(
                                                    color: const Color.fromARGB(
                                                        255, 25, 16, 58),
                                                    child: Column(children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        width: double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                await Provider.of<
                                                                            DataMovieDetailCyberProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getDataDetailMovieCyber(
                                                                        context,
                                                                        '${phim.maPhim}');
                                                                await Provider.of<
                                                                            DataMovieDetailCyberProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getDataRapCyber(
                                                                        context,
                                                                        '${phim.maPhim}');
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    AppRoute
                                                                        .movieDetailCyber);
                                                              },
                                                              child:
                                                                  Image.network(
                                                                '${phim.hinhAnh}',
                                                                height: 150,
                                                                width:
                                                                    150 * 3 / 4,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child: Text(
                                                                  '${phim.tenPhim}'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .white),
                                                                  softWrap:
                                                                      true,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        decoration:
                                                            BoxDecoration(
                                                                border: Border(
                                                                    bottom:
                                                                        BorderSide(
                                                          color: Colors
                                                              .grey.shade400,
                                                          width: 1.0,
                                                        ))),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            children: (phim
                                                                        .lstLichChieuTheoPhim ??
                                                                    [])
                                                                .take(12)
                                                                .map(
                                                                    (lichChieu) {
                                                              DateTime
                                                                  dateTime =
                                                                  DateTime.parse(
                                                                      lichChieu
                                                                          .ngayChieuGioChieu!);
                                                              return Container(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    await Provider.of<CheckoutCyber>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .getThongTinPhimCyber(
                                                                            context,
                                                                            lichChieu.maLichChieu.toString());
                                                                    await Navigator.pushNamed(
                                                                        context,
                                                                        AppRoute
                                                                            .movieScreenSeatCyber);
                                                                  },
                                                                  child:
                                                                      CustomButtonSelectCyber(
                                                                    text1:
                                                                        '${lichChieu.tenRap}',
                                                                    style1:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    text2:
                                                                        'Giờ chiếu: ${DateFormat('HH:mm').format(dateTime)}',
                                                                    style2:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    text3:
                                                                        'Ngày: ${DateFormat('dd/MM/yyyy').format(dateTime)}',
                                                                    style3:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          233,
                                                                          233,
                                                                          233),
                                                                    ),
                                                                    text4: '',
                                                                    style4:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          233,
                                                                          233,
                                                                          233),
                                                                    ),
                                                                    width: 150,
                                                                    height: 130,
                                                                    backgroundColor1:
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            250,
                                                                            139,
                                                                            49),
                                                                    backgroundColor2:
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            189,
                                                                            77,
                                                                            17),
                                                                    borderColor1:
                                                                        const Color(
                                                                            0XFFfdca49),
                                                                    borderColor2:
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            175,
                                                                            71,
                                                                            14),
                                                                    backgroundColor3:
                                                                        const Color.fromARGB(
                                                                            255,
                                                                            224,
                                                                            113,
                                                                            8),
                                                                  ),
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      )
                                                    ]),
                                                  );
                                                }).toList()),
                                              )));
                                    }).toList(),
                                  ),
                                )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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

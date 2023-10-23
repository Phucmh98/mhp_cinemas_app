import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/film_model.dart';
import 'package:flutter_cinema_06/model/movie_detail_cyber.dart';
import 'package:flutter_cinema_06/model/thongTinRap_cyber.dart';
import 'package:flutter_cinema_06/provider/check_out_cyber_provider.dart';
import 'package:flutter_cinema_06/provider/data_movie_provider_cyber.dart';
import 'package:flutter_cinema_06/widgets/custom_button_select_cyber.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

List<DataFilm> dataListFilm = [];

class MovieDetailCyber extends StatefulWidget {
  const MovieDetailCyber({super.key});
  @override
  State<MovieDetailCyber> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MovieDetailCyber> {

  List<DetailMovieCyber> detailMovieCyber = [
    DetailMovieCyber(
      maPhim: 10895,
      tenPhim: "MHP Name Phim",
      biDanh: "MHP Name Phim",
      trailer: "https://picsum.photos/200/300",
      hinhAnh: "https://picsum.photos/200/300",
      moTa: "Somethings wrong. Please try again",
      maNhom: "GP00",
      hot: true,
      dangChieu: true,
      sapChieu: false,
      ngayKhoiChieu: "2023-09-13",
      danhGia: 4,
    ),
  ];

  //phúc cyber
  int danhGia = 0;
  List<HeThongRapChieu>? dataHeThongRap;
  @override
  void initState() {
    super.initState();
    
  }

  void updateDanhGia(int newDanhGia) {
    setState(() {
      danhGia = newDanhGia;
    });
  }

  void fetchData() async{
    DataMovieDetailCyberProvider dataMovieDetailCyberProvider =
        Provider.of<DataMovieDetailCyberProvider>(context);
    detailMovieCyber =  await dataMovieDetailCyberProvider.dataMovieDetail;
    updateDanhGia(detailMovieCyber[0].danhGia!);
    dataHeThongRap =  dataMovieDetailCyberProvider.dataHeThongRap;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              '${detailMovieCyber[0].hinhAnh}',
              fit: BoxFit.cover,
              color: const Color(0xFF130B2B).withOpacity(0.9),
              colorBlendMode: BlendMode.multiply,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: MediaQuery.of(context).size.height - 300,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xFF130B2B).withOpacity(0),
                const Color(0xFF130B2B),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              // height: MediaQuery.of(context).size.height,
              child: Container(
                  padding:  const EdgeInsets.only(top: 90),
                  width: width - 50,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${detailMovieCyber[0].tenPhim}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RatingBarIndicator(
                          rating: danhGia / 2,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Rate ${danhGia / 2}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(
                          '${detailMovieCyber[0].moTa}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.4,
                              height: 1.3),
                          trimLines: 4,
                          moreStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          lessStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: ' Show less',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var youtubeLink = '${detailMovieCyber[0].trailer}';

                            if (await canLaunch(youtubeLink)) {
                              await launch(youtubeLink);
                            } else {
                              throw 'Không thể mở liên kết';
                            }
                          },
                          child: Container(
                            width: 140,
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 252, 210, 55), // Màu 1
                                  Color.fromARGB(255, 221, 90, 18), // Màu 2
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.play_circle_outline_rounded,
                                      size: 30, color: Colors.white),
                                  Text(
                                    'Play trailer',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          ('Choose your Cinemas'),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: (dataHeThongRap ?? []).map((htr) {
                              return Container(
                                color: const Color.fromARGB(255, 15, 9, 34),
                                width: width,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ExpansionWidget(
                                    initiallyExpanded: false,
                                    titleBuilder: (double animationValue, _,
                                        bool isExpaned, toogleFunction) {
                                      return InkWell(
                                          onTap: () =>
                                              toogleFunction(animated: true),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.network(
                                                  '${htr.logo}',
                                                  width: 50,
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  '${htr.tenHeThongRap}',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                                Transform.rotate(
                                                  angle: math.pi *
                                                      animationValue /
                                                      2,
                                                  child: const Icon(
                                                    Icons.arrow_right,
                                                    size: 40,
                                                    color: Colors.white,
                                                  ),
                                                  alignment: Alignment.center,
                                                )
                                              ],
                                            ),
                                          ));
                                    },
                                    content: Container(
                                      width: double.infinity,
                                      color:
                                          const Color.fromARGB(255, 28, 17, 65),
                                      // padding: EdgeInsets.all(20),
                                      child: SizedBox(
                                        child: Column(
                                          children: (htr.cumRapChieu ?? [])
                                              .map((crc) {
                                            return Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 25, 16, 58),
                                                          border: Border(
                                                            bottom: BorderSide(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        189,
                                                                        188,
                                                                        188)),
                                                          )),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 2,
                                                          child: Image.network(
                                                            '${htr.logo}',
                                                            height: 40,
                                                            width: 40,
                                                          )),
                                                      Expanded(
                                                        flex: 8,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            5),
                                                                width: double
                                                                    .infinity,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                    '${crc.tenCumRap}',
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w400))),
                                                            Container(
                                                                width: double
                                                                    .infinity,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            5),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  '${crc.diaChi}',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          216,
                                                                          215,
                                                                          215),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300),
                                                                )),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 10),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children:
                                                          (crc.lichChieuPhim ??
                                                                  [])
                                                              .map((lcp) {
                                                        // Chuyển đổi chuỗi kiểu ngày giờ thành đối tượng DateTime
                                                        DateTime dateTime =
                                                            DateTime.parse(lcp
                                                                .ngayChieuGioChieu!);

                                                        // Định dạng DateTime thành chuỗi theo định dạng 'HH:mm'
                                                        String formattedTime =
                                                            DateFormat('HH:mm')
                                                                .format(
                                                                    dateTime);
                                                        String formattedDate =
                                                            DateFormat(
                                                                    'dd/MM/yyyy')
                                                                .format(
                                                                    dateTime);
                                                        return GestureDetector(
                                                          onTap: () async {
                                                            await Provider.of<
                                                                        CheckoutCyber>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .getThongTinPhimCyber(
                                                                    context,
                                                                    lcp.maLichChieu);
                                                            await Navigator
                                                                .pushNamed(
                                                                    context,
                                                                    AppRoute
                                                                        .movieScreenSeatCyber);
                                                            print(lcp
                                                                .maLichChieu);
                                                          },
                                                          child:
                                                              CustomButtonSelectCyber(
                                                            text1:
                                                                '${lcp.tenRap}',
                                                            style1:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            text2:
                                                                'Showtime: $formattedTime',
                                                            style2:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            text3:
                                                                'Run time: ${lcp.thoiLuong}m',
                                                            style3:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      233,
                                                                      233,
                                                                      233),
                                                            ),
                                                            text4:
                                                                'Date: ${formattedDate}',
                                                            style4:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      233,
                                                                      233,
                                                                      233),
                                                            ),
                                                            width: 150,
                                                            height: 130,
                                                            backgroundColor1:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    250,
                                                                    139,
                                                                    49),
                                                            backgroundColor2:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    189,
                                                                    77,
                                                                    17),
                                                            borderColor1:
                                                                const Color(
                                                                    0XFFfdca49),
                                                            borderColor2:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    175,
                                                                    71,
                                                                    14),
                                                            backgroundColor3:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    224,
                                                                    113,
                                                                    8),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ))),
          Container(
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
                          onTap: () {
                            Navigator.of(context).pop();
                            dataListFilm = [];
                            detailMovieCyber = [];
                            dataHeThongRap = [];
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
                                color: Colors.transparent,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

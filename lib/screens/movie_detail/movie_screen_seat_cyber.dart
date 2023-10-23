import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/danh_sach_phong_ve_cyber.dart';

import 'package:flutter_cinema_06/provider/check_out_cyber_provider.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';
import 'package:flutter_cinema_06/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';



List<Map<String, dynamic>> danhSachVe = [];
List<String> seatSelectingList = [];
List<String> firstCharacters = [];
List<String> chairIDList = [];
List<dynamic> priceList = [];
List<double> priceListSeat = [];




// Hàm add vào list ghế được chọn
void selectingSeat(String seat, List<String> listSeat) {
  int index = listSeat.indexOf(seat);
  if (index != -1) {
    listSeat.removeAt(index);
  } else {
    listSeat.add(seat);
  }
}

void selectingSeatOb(
    int maGhe, double price,String loaiGhe,String stt, List<Map<String, dynamic>> danhSachVe) {
  int index = danhSachVe.indexWhere((ve) => ve['maGhe'] == maGhe);
  if (index != -1) {
    // Đã chọn ghế này, loại bỏ khỏi danh sách vé
    danhSachVe.removeAt(index);
  } else {
    // Ghế chưa được chọn, thêm vào danh sách vé với giá trị mặc định
    danhSachVe.add({"maGhe": maGhe, "giaVe": price,"loaiGhe": loaiGhe,"stt":stt});
  }
}



//Hàm thay đổi ghế nế đúng trả màu ghế
bool selectChange(String seat) {
  int index = seatSelectingList.indexOf(seat);
  if (index != -1) {
    return true;
  }
  return false;
}



//Hàm trả về ghế được book để không cho tap
Object seatBooked(String loaiGhe, String taiKhoanNguoiDat) {
  if (loaiGhe == "Thuong" && taiKhoanNguoiDat == null) {
    return AppImages.seat_default;
  } else if (loaiGhe == "Vip" && taiKhoanNguoiDat == null) {
    return AppImages.seat_vip;
  }
  return AppImages.seat_active;
}



//Hàm hết hạn phim hoặc k có ghế
bool checkExpiredFilm(List<Map<String, dynamic>> listData) {
  if (listData != null) {
    return true;
  } else {
    return false;
  }
}

class MovieScreenSeatCyber extends StatefulWidget {
  const MovieScreenSeatCyber({super.key});
  @override
  State<MovieScreenSeatCyber> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MovieScreenSeatCyber> {
  List<Map<String, dynamic>>? danhSachGheProvider;

  List<Map<String, dynamic>>? danhsachGhe = [];
  //của phuc
  List<ThongTinPhim?> danhthongtin = [];
  List<DanhSachGheCyber?> danhSachGheCyber = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppFunction.hideLoading(context);
    });



    CheckoutCyber checkout = Provider.of<CheckoutCyber>(context, listen: false);
    danhthongtin = checkout.listThongTinPhim;
    danhSachGheCyber = checkout.listDanhSachGhe;

    //lấy thông tin ghế
    


    danhSachVe.clear();
    seatSelectingList.clear();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;


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
                          onTap: () {
                            Navigator.pop(context);
                           
                            setState(() {


                              danhSachVe=[];
                              seatSelectingList=[];
                            });
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
                  'Choose Seats',
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
                  width: width - 50,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        
                        SizedBox(
                          child: Image.asset(
                            AppImages.screen_highlight,
                            width: width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        SizedBox(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: List.generate(10, (rowIndex) {
                                return Row(
                                  children: List.generate(16, (seatIndex) {
                                    final index = rowIndex * 16 + seatIndex;
                                    if (index < danhSachGheCyber.length) {
                                      DanhSachGheCyber? ghe =
                                          danhSachGheCyber[index];
                                      bool? gheDaDat = ghe!.daDat;
                                      String? loaiGhe = ghe.loaiGhe;
                                      String? taiKhoanNguoiDat =
                                          ghe.taiKhoanNguoiDat;
                                      String? sttGhe = ghe.stt;
                                      double? giaVe = ghe.giaVe;
                                      int? maGhe = ghe.maGhe;
                                      return IgnorePointer(
                                        ignoring: gheDaDat == true,
                                        child: GestureDetector(
                                          onTap: () {
                                            selectingSeatOb(
                                                maGhe!, giaVe!,loaiGhe!,sttGhe!, danhSachVe);
                                            print(danhSachVe);
                                            selectingSeat(
                                                sttGhe, seatSelectingList);
                                            print(seatSelectingList);
                                            // selectingSeatPrice(
                                            //     giaVe!, priceListSeat);
                                            // print(priceListSeat);
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 35,
                                            height: 30,
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  gheDaDat!
                                                      ? AppImages.seat_active
                                                      : (selectChange(sttGhe!)
                                                          ? AppImages
                                                              .seat_selected
                                                          : loaiGhe == 'Vip'
                                                              ? AppImages
                                                                  .seat_vip
                                                              : AppImages
                                                                  .seat_default),
                                                ),
                                                fit: BoxFit
                                                    .fill, // Tuỳ chỉnh chế độ hiển thị hình ảnh
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${ghe.stt}',
                                                style: const TextStyle(
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox(
                                        width: 40,
                                      ); // Khoảng cách cho các ô trống
                                    }
                                  }),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Avaiable',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Color(0xFFB6116B),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Reserved',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.circle,
                                    size: 12,
                                    color: Color(0xFF09FBD3),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Selected',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (seatSelectingList.isEmpty) {
                              AppFounction.showCustomDialogFail(
                                  context,
                                  'Book tickets Fail',
                                  'Please choose your seats !');
                            } else {
                              AppFounction.showCustomDialogSucces(
                                  context,
                                  "Booked Seats Succes",
                                  "Please wait a moment",
                                  false);
                              await Future.delayed(
                                  const Duration(milliseconds: 1500));
                              Navigator.pushReplacementNamed(
                                  context, AppRoute.movieScreenOrderCyber);
                              CheckoutCyber checkout =
                                  Provider.of<CheckoutCyber>(context,
                                      listen: false);
                              for (var ve in danhSachVe) {
                                checkout.danhSachVe.add(ve);
                              }

                              checkout.seatSelectingList = seatSelectingList;
                            }
                          },
                          child: CustomButton(
                              text: 'Checkout',
                              width: width,
                              height: 50,
                              textColor: Colors.white,
                              backgroundColor1: const Color.fromARGB(255, 252, 210, 55),
                              backgroundColor2: const Color.fromARGB(255, 221, 90, 18),
                              borderColor1: const Color.fromARGB(255, 252, 210, 55),
                              borderColor2: const Color.fromARGB(255, 221, 90, 18)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

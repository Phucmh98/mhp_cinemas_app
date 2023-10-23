import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/danh_sach_phong_ve_cyber.dart';
import 'package:flutter_cinema_06/network/api_request.dart';
import 'package:flutter_cinema_06/network/apibase/api_response.dart';
import 'package:flutter_cinema_06/provider/check_out_cyber_provider.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';
import 'package:flutter_cinema_06/widgets/button_bg_trans.dart';
import 'package:flutter_cinema_06/widgets/button_icon_tick.dart';
import 'package:flutter_cinema_06/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

List<dynamic> responseData = [];
List<Map<String, dynamic>> danhSachGhe = [];

class SelectPayment {
  String urlImg;
  String text;
  bool tick;

  SelectPayment({required this.urlImg, required this.text, this.tick = false});
}

List<SelectPayment> paymentSelected = [
  SelectPayment(urlImg: AppImages.icPapal, text: 'Paypal', tick: true),
  SelectPayment(urlImg: AppImages.icGoogle, text: 'Google Pay', tick: false),
  SelectPayment(urlImg: AppImages.icApple, text: 'Apple Pay', tick: false),
  SelectPayment(
      urlImg: AppImages.logo_mastercard,
      text: '**** **** **** 1234',
      tick: false),
];
final apiUrl = 'https://64a2bdc2b45881cc0ae59e5b.mockapi.io/payment';

//Hàm add list api vào list dự án
void addListpaymentSelected(List<dynamic> listAPI) {
  paymentSelected.removeRange(4, paymentSelected.length);
  for (var i = 0; i < listAPI.length; i++) {
    paymentSelected.add(SelectPayment(
      urlImg: AppImages.logo_mastercard,
      text: "**** **** **** ${extractLastFourDigits(listAPI[i]["numberPay"])}",
      tick: false,
    ));
  }
}

void updatePaymentSelection(int selectedIndex) {
  for (int i = 0; i < paymentSelected.length; i++) {
    if (i == selectedIndex) {
      paymentSelected[i].tick = true;
    } else {
      paymentSelected[i].tick = false;
    }
  }
}

//hàm trả về 4 chữ số cuối
String extractLastFourDigits(String text) {
  if (text.length >= 4) {
    return text.substring(text.length - 4);
  } else {
    return text;
  }
}

class PaymentScreenCyber extends StatefulWidget {
  const PaymentScreenCyber({super.key});
  @override
  State<PaymentScreenCyber> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PaymentScreenCyber> {
  List<Map<String, dynamic>> danhSachVe = [];
  List<ThongTinPhim?> danhSachThongTin = [];
  String? maLichChieu;
  int indexTick = 1;
  String? idFilm;
  List<String> listIdChair = [];
  void fetchPaymentData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      responseData = jsonDecode(response.body);
      setState(() {
        addListpaymentSelected(responseData);
      });
    } else {
      print('Lỗi khi lấy dữ liệu từ API');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppFunction.hideLoading(context);
    });

    fetchPaymentData();
    addListpaymentSelected(responseData);

    CheckoutCyber checkout = Provider.of<CheckoutCyber>(context, listen: false);
    danhSachVe = checkout.danhSachVe;
    danhSachThongTin = checkout.listThongTinPhim;
    maLichChieu = danhSachThongTin[0]?.maLichChieu.toString();

    for (var ghe in danhSachVe) {
      final maGhe = ghe['maGhe'];
      final giaVe = ghe['giaVe'];

      danhSachGhe.add({"maGhe": maGhe, "giaVe": giaVe});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchPaymentData();
    addListpaymentSelected(responseData);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // print(idFilm);
    // print(listIdChair);

    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
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
                stops: [0.1, 0.35, 1],
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
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF453E59),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(
                  width: width - 50,
                  child: const Text(
                    'Select the payment method you want to use',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...paymentSelected.asMap().entries.map((entry) {
                          final index = entry.key;
                          final payment = entry.value;
                          return GestureDetector(
                            onTap: () {
                              // Xử lý khi nhấn vào
                              // Đổi giá trị tick của phần tử được nhấn
                              setState(() {
                                indexTick = index;
                                updatePaymentSelection(indexTick);
                              });
                            },
                            child: ButtonIconTick(
                              backgroundColor: Colors.transparent,
                              borderColor1: const Color(0xFF60FFCA),
                              borderColor2:
                                  const Color(0xFFFFFFFF).withOpacity(0.6),
                              height: 80,
                              img: payment.urlImg,
                              width: width,
                              text: payment.text,
                              icon: payment.tick
                                  ? const Icon(Icons.radio_button_checked)
                                  : const Icon(Icons.circle_outlined),
                            ),
                          );
                        }).toList(),
                        GestureDetector(
                          onTap: () {
                            AppFunction.showLoading(context);
                            Navigator.pushNamed(
                                context, AppRoute.paymentScreenCard);
                          },
                          child: ButtonBgTrans(
                            backgroundColor: Colors.transparent,
                            borderColor1: const Color(0xFFFF53C0),
                            borderColor2:
                                const Color(0xFFFFFFFF).withOpacity(0.6),
                            height: 50,
                            textColor: const Color(0xFFFFFFFF),
                            width: width,
                            text: 'Add New Card',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  'Review Details',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    AppFunction.showLoading(context);

                    ApiResponse resCyber =
                        await ApiRequest.datVeCyber(maLichChieu!, danhSachGhe);
                    print('checkout');
                    if (resCyber.result == true) {
                      await Future.delayed(const Duration(milliseconds: 1000));
                      AppFunction.hideLoading(context);
                      AppFounction.showCustomDialogSucces(
                          context,
                          "Payment success",
                          "Wait a moment, it will return to the Home screen",
                          false);
                      Navigator.pushNamed(context, AppRoute.dashBroard);
                    }

                    // AppFounction.showCustomDialogSucces(
                    //     context,
                    //     "Payment success",
                    //     "Wait a moment, it will return to the Home screen",
                    //     false);
                    // // Delay 0.5 giây trước khi chuyển màn hình
                    // await Future.delayed(const Duration(milliseconds: 1000));

                    // Chuyển qua màn hình khác ở đây
                    // Navigator.pushNamed(context, AppRoute.dashBroard);
                    else {
                      AppFunction.hideLoading(context);
                      AppFounction.showCustomDialogFail(
                        context,
                        "Payment fail",
                        "Please try again",
                      );
                    }
                  },
                  child: CustomButton(
                      text: 'Checkout',
                      width: width,
                      height: 50,
                      textColor: Colors.white,
                      backgroundColor1: const Color.fromARGB(255, 252, 210, 55),
                      backgroundColor2: const Color.fromARGB(255, 221, 89, 18),
                      borderColor1: const Color.fromARGB(255, 252, 210, 55),
                      borderColor2: const Color.fromARGB(255, 221, 89, 18)),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

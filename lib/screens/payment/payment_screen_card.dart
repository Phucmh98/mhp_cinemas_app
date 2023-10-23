import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/utils/app_founction_dialog.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';

import 'package:flutter_cinema_06/widgets/custom_button.dart';
import 'package:flutter_cinema_06/widgets/input_text_trans.dart';
import 'package:flutter_cinema_06/widgets/widget_master_card.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

final apiUrl = 'https://64a2bdc2b45881cc0ae59e5b.mockapi.io/payment';

void fetchPaymentData() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);

    // Xử lý dữ liệu trả về
  } else {
    print('Lỗi khi lấy dữ liệu từ API');
  }
}

Future<void> addPayment(String payName, String numberPay, String id) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'payName': payName,
      'numberPay': numberPay,
      'id': id,
    }),
  );

  if (response.statusCode == 201) {
    print('Thêm đối tượng thành công');
  } else {
    print('Lỗi khi thêm đối tượng');
  }
}

void deletePayment(String id) async {
  final deleteUrl = '$apiUrl/$id';
  final response = await http.delete(Uri.parse(deleteUrl));
  if (response.statusCode == 200) {
    // Xóa dữ liệu thành công

    print('Xóa thành công');
  } else {
    print('Lỗi khi xóa dữ liệu');
  }
}

void updatePayment(
    String id, String updatedPayName, String updatedNumberPay) async {
  final updateUrl = '$apiUrl/$id';

  // Tạo body request dựa trên dữ liệu cần cập nhật
  final body = {
    'payName': updatedPayName,
    'numberPay': updatedNumberPay,
  };

  final response = await http.put(Uri.parse(updateUrl), body: body);
  if (response.statusCode == 200) {
    // Cập nhật dữ liệu thành công

    print('Cập nhật thành công');
  } else {
    print('Lỗi khi cập nhật dữ liệu');
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

class PaymentScreenCard extends StatefulWidget {
  const PaymentScreenCard({super.key});
  @override
  State<PaymentScreenCard> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PaymentScreenCard> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController nameonCard = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController securityCode = TextEditingController();

  String cardholderName = 'Maddy';
  String cardDate = '01/22';
  String numberCard = '1234123412341234';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppFunction.hideLoading(context);
    });
    fetchPaymentData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF170641),
              Color(0xFF2E1371),
              Color(0xFF323559),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                                    Icons.calendar_month_rounded,
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
                SizedBox(
                  width: width - 50,
                  child: const Text(
                    'Payment',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.paypal_card1),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(AppImages.applePay_card),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(AppImages.applePay_card),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        WidgetMasterCard(
                          height: 200,
                          width: width - 50,
                          textName: '${cardholderName}',
                          textDay: '${cardDate}',
                          textNumberEnd: '${extractLastFourDigits(numberCard)}',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputTextTrans(
                          textTitle: 'Card Number',
                          textInput: cardNumber,
                          width: width - 50,
                          textHint: 'Card Number',
                          passwordAccount: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InputTextTrans(
                          textTitle: 'Name on Card',
                          textInput: nameonCard,
                          width: width - 50,
                          textHint: 'Name on Card',
                          passwordAccount: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: width - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputTextTrans(
                                textTitle: 'Expiry Date',
                                textInput: expiryDate,
                                width: (width - 70) / 2,
                                textHint: 'Expiry Date',
                                passwordAccount: false,
                              ),
                              InputTextTrans(
                                textTitle: 'Security Code',
                                textInput: securityCode,
                                width: (width - 70) / 2,
                                textHint: 'Security Code',
                                passwordAccount: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
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
                  onTap: () {
                    // deletePayment('3');
                    if (nameonCard.text.isNotEmpty &&
                        cardNumber.text.isNotEmpty &&
                        cardNumber.length == 12) {
                      addPayment(
                          '${nameonCard.text}', '${cardNumber.text}', '1');
                      Navigator.pop(context);
                      AppFounction.showCustomDialogSucces(
                          context,
                          'Success Add',
                          'The card has been added successfully',
                          false);
                    } else {
                      AppFounction.showCustomDialogFail(
                          context,
                          'Add Payment Fail',
                          'Please check Card Number, Name on Card is blank');
                    }

                    setState(() {});
                  },
                  child: CustomButton(
                      text: 'Add',
                      width: width - 50,
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

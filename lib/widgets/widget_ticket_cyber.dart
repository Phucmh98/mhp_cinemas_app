import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class WidgetTicketCyber extends StatefulWidget {
  final String urlImg;
  final String tenPhim;
  final String diaChi;
  final String ngayChieu;
  final String gioChieu;
  final String rap;
  final String tenGhe;
  const WidgetTicketCyber({
    super.key,
    required this.urlImg,
    required this.tenPhim,
    required this.diaChi,
    required this.ngayChieu,
    required this.gioChieu,
    required this.rap,
    required this.tenGhe,
  });

  @override
  _WidgetTicketCyberState createState() => _WidgetTicketCyberState();
}

class _WidgetTicketCyberState extends State<WidgetTicketCyber> {
  final colorBg = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Stack(
        children: [
          Container(
            height: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.urlImg),
                fit: BoxFit.fill, // Chọn cách thể hiện hình ảnh trong Container
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            // Các phần tử con của Container ở đây (nếu có)
          ),
          Positioned(
            top: 370,
            width: 270,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.tenPhim,
                    style: TextStyle(
                        color: Colors.blueGrey.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1),
                    minFontSize: 10,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AutoSizeText.rich(
                    minFontSize: 10.0, // Đặt kích thước font tối thiểu
                    TextSpan(
                      text: 'Address: ',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontWeight: FontWeight
                              .w500), // Bạn có thể thay đổi kiểu chữ mặc định tại đây
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.diaChi,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.orange, // Màu cam
                                    width: 3.0, // Độ dày của viền
                                  ),
                                ),
                              ),
                              child: AutoSizeText(
                                'DATE:',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                minFontSize: 10,
                              ),
                            ),
                            AutoSizeText(
                              widget.ngayChieu,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 11.0,
                              ),
                              minFontSize: 10,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.orange, // Màu cam
                                    width: 3.0, // Độ dày của viền
                                  ),
                                ),
                              ),
                              child: AutoSizeText(
                                'TIME:',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                minFontSize: 10,
                              ),
                            ),
                            AutoSizeText(
                              widget.gioChieu,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 11.0,
                              ),
                              minFontSize: 10,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.orange, // Màu cam
                                    width: 3.0, // Độ dày của viền
                                  ),
                                ),
                              ),
                              child: AutoSizeText(
                                'CINEMA:',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                                minFontSize: 10,
                              ),
                            ),
                            AutoSizeText(
                              widget.rap,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 11.0,
                              ),
                              minFontSize: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AutoSizeText.rich(
                    minFontSize: 10,
                    TextSpan(
                      text: 'Seats: ',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontWeight: FontWeight
                              .w500), // Bạn có thể thay đổi kiểu chữ mặc định tại đây
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.tenGhe,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade800,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

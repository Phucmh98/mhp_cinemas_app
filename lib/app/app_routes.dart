import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/screens/account/account_screen2.dart';
import 'package:flutter_cinema_06/screens/category/category_screen.dart';
import 'package:flutter_cinema_06/screens/dashboard/dasboard_screen.dart';
//Màn forgot password
import 'package:flutter_cinema_06/screens/forgot_password/screen_forgot_password.dart';
import 'package:flutter_cinema_06/screens/forgot_password/screen_forgot_password_create.dart';
import 'package:flutter_cinema_06/screens/forgot_password/screen_forgot_password_email.dart';
import 'package:flutter_cinema_06/screens/forgot_password/screen_forgot_password_sms.dart';
import 'package:flutter_cinema_06/screens/home/home_screen.dart';
import 'package:flutter_cinema_06/screens/movie_detail/movie_detail_cyber.dart';
import 'package:flutter_cinema_06/screens/movie_detail/movie_screen_order_cyber.dart';
import 'package:flutter_cinema_06/screens/movie_detail/movie_screen_seat_cyber.dart';

import 'package:flutter_cinema_06/screens/payment/payment_screen_card.dart';
import 'package:flutter_cinema_06/screens/payment/payment_screen_cyber.dart';
import 'package:flutter_cinema_06/screens/ticket/ticket_screen.dart';

//Màn login
import '../screens/login/screen_create_account.dart';
import '../screens/login/screen_login.dart';
import '../screens/login/screen_sign_in.dart';
import '../screens/login/screen_started.dart';
import '../screens/login/screen_times.dart';
// Import của Phúc làm ///

class AppRoute {
  // Đây là màn của Phúc làm ////////
  //Màn login
  static const screenTime = "../screens/login/screen_times";
  static const screenStarted = "../screens/login/screen_started";
  static const screenSignin = "../screens/login/screen_sign_in";
  static const screenCreateAccount =
      "../login/screens/screen_create_account.dart";
  static const screenLogin = "../screens/login/screen_login.dart";
  //Màn forgot password
  static const screenForgotPassword =
      "../screens/forgot_password/screen_forgot_password.dart";
  static const screenForgotPasswordSMS =
      "../screens/forgot_password/screen_forgot_password_sms.dart";
  static const screenForgotPasswordEmail =
      "../screens/forgot_password/screen_forgot_password_email.dart";
  static const screenForgotPasswordCreate =
      "../screens/forgot_password/screen_forgot_password_create.dart";

  static const login = "/login_page.dart";
  static const dashBroard = "/dash_broard.dart";
  static const itemView = "/item_view.dart";
  static const settingView = "/setting_view.dart";
  static const homeScreen = "/home-screen";
  static const categoryScreen = "/category_screen";
  static const paymentScreen = "/payment_screen";
  static const paymentScreenCard = "/payment_screen_card";
  static const movieScreen = "/movie_screen";
  static const movieScreenDetail = "/movie_screen_detail";
  static const movieScreenSeat = "/movie_screen_seat";
  static const movieScreenOrder = "/movie_screen_order";
  static const ticketScreenSeat = "/ticket_screen";
  static const seeMore = "/see_more_screen.dart";
  static const homeMoveiScreen = "/homemovie";
  static const accountScreen1 = "/account_sccren1";
  static const accountScreen2 = "/account_screen2";
  static const movieDetailCyber = "/movie_detail_cyber";
  static const movieScreenSeatCyber = "/movie_screen_seat_cyber";
  static const movieScreenOrderCyber = "/movie_screen_order_cyber";
static const paymentScreenCyber = "/payment_screen_cyber";
  static final routes = <String, WidgetBuilder>{
//Màn login
    screenTime: (BuildContext context) => const ScreenTimes(),
    screenStarted: (BuildContext context) => ScreenStarted(),
    screenSignin: (BuildContext context) => const ScreenSignin(),
    screenCreateAccount: (BuildContext context) => const ScreenCreateAccount(),
    screenLogin: (BuildContext context) => const ScreenLogin(),
//Màn forgot password
    screenForgotPassword: (BuildContext context) =>
        const ScreenForgotPassword(),
    screenForgotPasswordSMS: (BuildContext context) =>
        const ScreenForgotPasswordSms(),
    screenForgotPasswordEmail: (BuildContext context) =>
        const ScreenForgotPasswordEmail(),
    screenForgotPasswordCreate: (BuildContext context) =>
        const ScreenForgotPasswordCreate(),
    //màn homeScreen
    homeScreen: (BuildContext context) => const HomeScreen(),
    dashBroard: (BuildContext context) => const DasboardScreen(),
    categoryScreen: (BuildContext context) => const CategoryScreen(),
    //Màn paymentscreen

    paymentScreenCard: (BuildContext context) => const PaymentScreenCard(),
    //Màn movie detail

    //Màn ticket detail
    ticketScreenSeat: (BuildContext context) => const TicketScreen(),
    // seeMore: (BuildContext context) =>  SeeMoreScreen(),

    //màn hình account screen profile
  
    accountScreen2: (BuildContext context) => const Acountscreen2(),

    movieDetailCyber: (BuildContext context) => const MovieDetailCyber(),
    movieScreenSeatCyber: (BuildContext context) => const MovieScreenSeatCyber(),
    movieScreenOrderCyber: (BuildContext context) => const MovieScreenOrderCyber(),
    paymentScreenCyber: (BuildContext context) => const PaymentScreenCyber(),
    
  };
}

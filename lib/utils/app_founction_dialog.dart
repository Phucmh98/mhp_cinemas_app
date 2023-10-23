import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';

class AppFounction {
  static void showCustomDialog(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Nhập lại'),
              onPressed: () {
                Navigator.of(context).pop();
                // Xử lý sau khi đóng dialog
              },
            ),
          ],
        );
      },
    );
  }

  static void showCustomDialogFail(
    BuildContext context,
    String title,
    String message,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      showCloseIcon: true,
      title: title,
      desc: message,
      btnCancelColor: Color.fromARGB(255, 207, 49, 70),
      btnCancelOnPress: () {},
    ).show();
  }
  static void showCustomDialogWarning(
    BuildContext context,
    String title,
    String message,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      showCloseIcon: true,
      title: title,
      desc: message,
      btnOkColor: Colors.amber[600],
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }


  static void showCustomDialogSucces(
      BuildContext context, String title, String message, bool btnHide) {
    if (btnHide) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: title,
        desc: message,
        btnOkOnPress: () {
          
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: title,
        desc: message,
      ).show();
    }
  }
  static void showCustomDialogRoute(
      BuildContext context, String title, String message, bool btnHide,String routeName) {
    if (btnHide) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: title,
        desc: message,
        btnOkOnPress: () {
          Navigator.pushNamed(context, routeName);
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: title,
        desc: message,
      ).show();
    }
  }

  
}

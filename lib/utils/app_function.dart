import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class AppFunction {
  static showLoading(BuildContext context) async {
    context.read<LoadingProvider>().showLoading();
  }
  static hideLoading(BuildContext context) async {
    context.read<LoadingProvider>().hideLoading();
  }
}

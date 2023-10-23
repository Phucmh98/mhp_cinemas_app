import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/provider/check_out_cyber_provider.dart';
import 'package:flutter_cinema_06/provider/data_movie_provider_cyber.dart';
import 'package:flutter_cinema_06/provider/list_film_cyber_propvider.dart';
import 'package:flutter_cinema_06/provider/loading_provider.dart';
import 'package:flutter_cinema_06/provider/thong_tin_lich_chieu_provider_cyber.dart';
import 'package:flutter_cinema_06/provider/ticket_provider_cyber.dart';
import 'package:flutter_cinema_06/provider/user_register_provider_cyber.dart';
import 'package:flutter_cinema_06/widgets/keyboard_dismiss.dart';
import 'package:flutter_cinema_06/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(const MyApp());
}
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => DataMovieCyberProvider()),
        ChangeNotifierProvider(create: (_) => DataMovieDetailCyberProvider()), 
        ChangeNotifierProvider(create: (_) => CheckoutCyber()), 
        ChangeNotifierProvider(create: (_) => TicketCyber()), 
        ChangeNotifierProvider(create: (_) => ThongTinLichChieuHeThongRapCyber()), 
        ChangeNotifierProvider(create: (_) => UserRegisterCyber()),
        
      ],
      builder: (context, _) {
        return Consumer<LoadingProvider>(builder: (context, loading, child) {
          return KeyboardDismiss(
              child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Stack(
              children: [
                MaterialApp(
                  debugShowCheckedModeBanner: false,
                  routes: AppRoute.routes,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  // initialRoute: AppRoute.dashBroard,
                  initialRoute: AppRoute.screenTime,
                ),
                loading.isLoading
                    ? const LoadingWidget()
                    : const SizedBox.shrink()
              ],
            ),
          ));
        });
      },
    );
  }
}

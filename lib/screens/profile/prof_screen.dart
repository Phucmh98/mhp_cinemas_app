import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_fonts.dart';
import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/thong_tin_tai_khoan_cyber.dart';
import 'package:flutter_cinema_06/provider/ticket_provider_cyber.dart';
import 'package:flutter_cinema_06/widgets/widget_proflie.dart';
import 'package:provider/provider.dart';

class ProfScreen extends StatefulWidget {
  const ProfScreen({Key? key}) : super(key: key);

  @override
  State<ProfScreen> createState() => _ProfScreenState();
}

class _ProfScreenState extends State<ProfScreen> {
  List<ThongTinUserCyber> listThongTinUserCyber = [];
  String email = 'Waiting';
  String hoTen = 'Waiting';
  @override
  void initState() {
    super.initState();
  }

  void fetchData() async {
    TicketCyber dataProfile = Provider.of<TicketCyber>(context, listen: false);
    await dataProfile.getThongTinUserCyber(context);
    listThongTinUserCyber = dataProfile.listThongTinUserCyber;
    email = listThongTinUserCyber[0].email!;
    hoTen = listThongTinUserCyber[0].hoTen!;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      body: Stack(
        children: [
          Image.asset(
            AppImages.bgFilm,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Profile ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18),
                          ),
                        ),
                        Expanded(
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
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xff09FBD3),
                        const Color(0xff09FBD3).withOpacity(0),
                        const Color(0xffffffff).withOpacity(0.15),
                      ],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF130B2B).withOpacity(0.8),
                    ),
                    child: Image.asset(
                      "assets/images/ic_avatar.png",
                      width: 130,
                      height: 130,
                    ),
                  ),
                ),
                Text(
                  "${hoTen}",
                  style: AppFonts.poppinsW600(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "@${email}",
                  style: AppFonts.poppinsW600(
                    fontSize: 14,
                    color: const Color(0xffffffff).withOpacity(0.8),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xffa4c8ff).withOpacity(0.2),
                                const Color(0xffa4c8ff).withOpacity(0),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              WidgetProfile(
                                title: "Edit Profile",
                                img: AppImages.icPerson,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.accountScreen2);
                                },
                              ),
                              WidgetProfile(
                                title: "My Movie Pass",
                                img: AppImages.icMoviePass,
                              ),
                              WidgetProfile(
                                title: "Offers",
                                img: AppImages.icOffers,
                              ),
                              WidgetProfile(
                                title: "Notification",
                                img: AppImages.icNoti,
                              ),
                              WidgetProfile(
                                title: "Settings",
                                img: AppImages.icSetting,
                              ),
                              WidgetProfile(
                                title: "Help",
                                img: AppImages.icHelp,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                margin: const EdgeInsets.only(
                                    left: 3, right: 3, top: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.2,
                                    color: Colors.black,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.icLogout,
                                      alignment: Alignment.center,
                                      width: 14,
                                      height: 14,
                                    ),
                                    // ignore: prefer_const_constructors
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Log Out",
                                          style: AppFonts.robotoW500(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Image.asset(
                                          AppImages.icDiv,
                                          height: 1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

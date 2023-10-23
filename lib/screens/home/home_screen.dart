import 'package:flutter/material.dart';
import 'package:flutter_cinema_06/app/app_fonts.dart';

import 'package:flutter_cinema_06/app/app_images.dart';
import 'package:flutter_cinema_06/app/app_routes.dart';
import 'package:flutter_cinema_06/model/list_film_cyber.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_cinema_06/provider/data_movie_provider_cyber.dart';
import 'package:flutter_cinema_06/provider/list_film_cyber_propvider.dart';
import 'package:flutter_cinema_06/utils/app_function.dart';
import 'package:provider/provider.dart';

final List<String> card = [
  AppImages.card8,
  AppImages.card9,
  AppImages.card10,
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ListFilm> listMovie = [];
  // double width = 0.0; // Định nghĩa biến width
  // double heightImg = 0.0; // Định nghĩa biến heightImg

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppFunction.hideLoading(context);
    });
    DataMovieCyberProvider dataCyberMovieProvider =
        Provider.of<DataMovieCyberProvider>(context, listen: false);
    listMovie = dataCyberMovieProvider.listDataFilm;

  }

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width;
    // heightImg = width * 4 / 3 - 15;
    // print(listMovie[0].maPhim);
    double width = MediaQuery.of(context).size.width;
    double heightImg = width *0.8;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  'Choose your movie',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xffA4C8FF).withOpacity(0.1),
                        const Color(0xffA4C8FF).withOpacity(0.1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 0,
                        color: const Color(0xff000000).withOpacity(0.25),
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.icSearch,
                        height: 14,
                        width: 14,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Find your movie",
                            hintStyle: TextStyle(
                              color: const Color(0xffA4C8FF).withOpacity(0.3),
                            ),
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (value) async {
                            DataMovieCyberProvider dataCyberMovieProvider =
                                Provider.of<DataMovieCyberProvider>(context,
                                    listen: false);
                            await dataCyberMovieProvider.getDataFilmCyber(
                                context, 'GP00', value);
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0; i < card.length; i++)
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    // padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent),
                                    child: Image.asset(
                                      card[i],
                                      width: width,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "All movie",
                          style: AppFonts.openSansW700(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        GridView.builder(
                          gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            mainAxisExtent: heightImg,
                          ),
                          padding: EdgeInsets.only(top: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listMovie
                              .length, // Disable scrolling inside GridView
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print(listMovie[index].maPhim);
                                Navigator.pushNamed(
                                    context, AppRoute.movieDetailCyber);
                                Provider.of<DataMovieDetailCyberProvider>(
                                  context,
                                  listen: false,
                                ).getDataDetailMovieCyber(
                                  context,
                                  '${listMovie[index].maPhim}',
                                );
                                Provider.of<DataMovieDetailCyberProvider>(
                                  context,
                                  listen: false,
                                ).getDataRapCyber(
                                  context,
                                  '${listMovie[index].maPhim}',
                                );
                              },
                              child: Container(
                                width: width / 2,
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.network(
                                        '${listMovie[index].hinhAnh}',
                                        width: width / 2 - 15,
                                        height: (width / 2 - 15) * 4 / 3,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 5, top: 5),
                                      height: 50,
                                      child: Text(
                                        '${listMovie[index].tenPhim}'
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        )
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

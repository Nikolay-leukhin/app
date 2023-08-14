import 'dart:math';
import 'dart:ui';

import 'package:app/features/auth/data/user_repository.dart';
import 'package:app/features/home/cubit/home_cubit.dart';
import 'package:app/features/home/data/home_repository.dart';
import 'package:app/features/home/ui/home_page.dart';
import 'package:app/features/home/ui/weather_aspect_card.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/utils/gradients.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> pages = [HomePage(), HomePage(), HomePage()];

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  void _changePage(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: pages[index],
        bottomNavigationBar: _createNavigationBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          splashColor: AppColors.primary,
          backgroundColor: AppColors.primary,
          elevation: 40,
          onPressed: () {
            var state = context.read<HomeCubit>().state;
            if (state is HomeLoadedSuccessState) {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.transparent,
                  context: (context),
                  builder: ((context) {
                    return _createBottomSheet(context);
                  }));
            }
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  Widget _createBottomSheet(BuildContext ctx) {
    final _weather = context.read<HomeRepository>().currentWeather;
    //
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.black,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      height: MediaQuery.sizeOf(context).height * 0.75,
      child: SingleChildScrollView(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Wrap(
            runSpacing: 10.h,
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              WeatherAspectCard(
                icon: Icons.thermostat_rounded,
                my_children: [
                  Text('${_weather.feelsLikeTemp}°',
                      style: AppTypography.titleReg1.copyWith(
                        color: AppColors.primary,
                      )),
                  Text("Similar to the actual temperature.",
                      style: AppTypography.captionBold1.copyWith(
                        color: AppColors.quart,
                      )),
                ],
                label: 'feels like',
              ),
              WeatherAspectCard(
                icon: Icons.auto_graph_outlined,
                my_children: [
                  Text('${_weather.pressure}',
                      style: AppTypography.titleReg1.copyWith(
                        color: AppColors.primary,
                      )),
                ],
                label: 'pressure',
              ),
              WeatherAspectCard(
                icon: Icons.remove_red_eye,
                my_children: [
                  Text("${(_weather.visibility / 1000).round()} km",
                      style: AppTypography.titleReg1.copyWith(
                        color: AppColors.primary,
                      )),
                  Text("Disance of normal vision.",
                      style: AppTypography.captionBold1.copyWith(
                        color: AppColors.quart,
                      )),
                ],
                label: 'visibility',
              ),
              WeatherAspectCard(
                icon: Icons.set_meal_rounded,
                my_children: [
                  Text('${_weather.seaLevel}',
                      style: AppTypography.titleReg1.copyWith(
                        color: AppColors.primary,
                      )),
                  Text("The level of sea to ground.",
                      style: AppTypography.captionBold1.copyWith(
                        color: AppColors.quart,
                      )),
                ],
                label: 'sea level',
              ),
              WeatherAspectCard(
                icon: Icons.sunny_snowing,
                my_children: [
                  Text('${_weather.sunrise.hour}:${_weather.sunrise.minute}',
                      style: AppTypography.titleReg1.copyWith(
                        color: AppColors.primary,
                      )),
                  Text("${_weather.sunset.hour}:${_weather.sunset.minute} sunset.",
                      style: AppTypography.captionBold1.copyWith(
                        color: AppColors.quart,
                      )),
                ],
                label: 'sunrise',
              ),
              WeatherAspectCard(
                icon: Icons.liquor_outlined,
                my_children: [
                  Text('${_weather.humidity}%',
                      style: AppTypography.titleReg1.copyWith(
                        color: AppColors.primary,
                      )),
                ],
                label: 'humidiately',
              ),
              WeatherAspectCard(
                icon: Icons.wind_power_rounded,
                my_children: [
                  Expanded(
                      child: Stack(children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 5,
                      child: Align(alignment: Alignment.topCenter, child: Text('North', style: AppTypography.captionBold1.copyWith(color: AppColors.primary))),
                    ),
                    Positioned(right: 0, left: 0, bottom: 5, child: Align(alignment: Alignment.bottomCenter, child: Text('South', style: AppTypography.captionBold1.copyWith(color: AppColors.primary)))),
                    Positioned(right: 5, top: 0, bottom: 0, child: Align(alignment: Alignment.centerRight, child: Text('east', style: AppTypography.captionBold1.copyWith(color: AppColors.primary)))),
                    Positioned(left: 5, top: 0, bottom: 0, child: Align(alignment: Alignment.centerLeft, child: Text('west', style: AppTypography.captionBold1.copyWith(color: AppColors.primary)))),
                    Center(
                        child: Transform.rotate(
                      angle: (_weather.windDegree * pi) / 180,
                      child: Icon(
                        Icons.arrow_right_alt_rounded,
                        size: 60.sp,
                        color: AppColors.primary,
                      ),
                    )),
                  ])),
                  Text('${_weather.windSpeed} m/s', style: AppTypography.captionBold1.copyWith(color: AppColors.quart))
                ],
                label: 'wind',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createNavigationBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      shape: CircularNotchedRectangle(),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), gradient: AppGradients.black),
        width: MediaQuery.sizeOf(context).width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.place,
                  color: AppColors.primary,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu_open_rounded,
                  color: AppColors.primary,
                )),
          ],
        ),
      ),
    );
  }
}

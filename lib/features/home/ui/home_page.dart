import 'package:app/features/auth/data/user_repository.dart';
import 'package:app/features/home/data/home_repository.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    f();
    context.read<HomeCubit>().processLoadCurrentWeather();
  }

  void f() async {
    print(await context.read<UserRepository>().getUserCoordinates());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<HomeCubit>(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/backkk.png'), fit: BoxFit.cover),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 40,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      print(state);
                      if (state is HomeLoadedSuccessState) {
                        print('what');
                        final _reposiotory = context.watch<HomeRepository>();
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _reposiotory.currentWeather.placeName,
                                style: AppTypography.largeTitleReg.copyWith(color: AppColors.primary),
                              ),
                              Text(
                                "${_reposiotory.currentWeather.temp.toString()}°",
                                style: GoogleFonts.notoSerifSinhala(fontWeight: FontWeight.w300, color: AppColors.primary, fontSize: 94.sp),
                              ),
                              Text(_reposiotory.currentWeather.description,
                                  style: AppTypography.titleBold3.copyWith(
                                    color: AppColors.secondary,
                                  )),
                              Text("P: ${_reposiotory.currentWeather.pressure}& SL: ${_reposiotory.currentWeather.seaLevel}",
                                  style: AppTypography.titleBold3.copyWith(
                                    color: AppColors.primary,
                                  ))
                            ],
                          ),
                        );
                      } else if (state is HomeLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const Center(
                          child: Text("Something went wrong"),
                        );
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

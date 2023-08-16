import 'package:app/features/search/cubit/search_cubit.dart';
import 'package:app/features/search/ui/search_weather_card.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().loadUserWeatherSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: AppGradients.black),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Weather'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_city');
                },
                icon: Icon(
                  Icons.settings,
                  color: AppColors.primary,
                ))
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            child: Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
                  if (state is SearchWaitingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchLoadedSuccessState) {
                    return ListView.separated(
                      itemCount: state.weatherCityListForecast.length,
                      separatorBuilder: (context, index) => SizedBox(height: 15),
                      itemBuilder: (context, index) => SearchWeatherCard(
                        curWeather: state.weatherCityListForecast[index],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text('something went wrong ttry later'),
                    );
                  }
                })),
          ),
        ),
      ),
    );
  }
}

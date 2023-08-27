import 'package:app/features/add_city/cubit/add_city_cubit.dart';
import 'package:app/features/add_city/data/add_city_repository.dart';
import 'package:app/features/search/cubit/search_cubit.dart';
import 'package:app/models/city.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCityCard extends StatefulWidget {
  final City city;

  const AddCityCard({super.key, required this.city});

  @override
  State<AddCityCard> createState() => _AddCityCardState();
}

class _AddCityCardState extends State<AddCityCard> {
  bool ableToAdd = true;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> checkIsAbleToAddCard() async {
    final _prefs = context.read<AddCityCubit>().pref;
    //
    List<City> cityList = await _prefs.getCities();
    return !cityList.contains(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: AppGradients.black,
        border: Border.all(width: 2, color: AppColors.primary.withOpacity(0.7)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
              child: Text(
            '${widget.city.name} | ${widget.city.country}',
            style: AppTypography.bodyBold.copyWith(color: AppColors.primary),
          )),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => IconButton(
                onPressed: () async {
                  await context.read<AddCityCubit>().saveCity(widget.city);
                  bool isCardAbleToSave = await checkIsAbleToAddCard();
                  setState(() {
                    ableToAdd = isCardAbleToSave;
                  });

                  context.read<SearchCubit>().loadUserWeatherSubscriptions();
                },
                icon: Icon(
                  ableToAdd ? Icons.add_circle_outline_sharp : Icons.not_interested_rounded,
                  color: AppColors.primary,
                )),
          )
        ],
      ),
    );
  }
}

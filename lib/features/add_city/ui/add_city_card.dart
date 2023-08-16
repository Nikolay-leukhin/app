import 'package:app/features/add_city/cubit/add_city_cubit.dart';
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
          IconButton(
              onPressed: () {
                context.read<AddCityCubit>().saveCity(widget.city);
              },
              icon: Icon(
                Icons.add_circle_outline_sharp,
                color: AppColors.primary,
              ))
        ],
      ),
    );
  }
}

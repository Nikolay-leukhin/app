import 'package:app/models/city.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/utils/gradients.dart';
import 'package:flutter/material.dart';

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
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: AppGradients.black,
        border: Border.all(width: 2, color: AppColors.primary.withOpacity(0.7)),
      ),
      child: FittedBox(
          child: Text(
        '${widget.city.name} | ${widget.city.country}',
        style: AppTypography.bodyBold.copyWith(color: AppColors.primary),
      )),
    );
    ;
  }
}

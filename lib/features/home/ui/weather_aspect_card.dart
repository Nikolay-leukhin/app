import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherAspectCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final List<Widget> my_children;
  final bool isSmall;

  const WeatherAspectCard({super.key, required this.icon, required this.my_children, required this.label, this.isSmall = true});

  @override
  State<WeatherAspectCard> createState() => _WeatherAspectCardState();
}

class _WeatherAspectCardState extends State<WeatherAspectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: widget.isSmall ? MediaQuery.sizeOf(context).width * 0.4 : MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFD286FF).withOpacity(0.6),
          width: 1.5,
        ),
        gradient: AppGradients.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                size: 14.sp,
                color: AppColors.tertiary,
              ),
              const SizedBox(
                width: 10,
              ),
              FittedBox(
                child: Text(
                  widget.label,
                  style: AppTypography.subhedlineBold.copyWith(color: AppColors.tertiary),
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.my_children,
            ),
          ),
        ],
      ),
    );
  }
}

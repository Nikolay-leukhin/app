import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWeatherCard extends StatefulWidget {
  const SearchWeatherCard({super.key});

  @override
  State<SearchWeatherCard> createState() => _SearchWeatherCardState();
}

class _SearchWeatherCardState extends State<SearchWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 180.h,
      child: CustomPaint(
        painter: TrianglePainter(),
        child: Container(
          alignment: Alignment.bottomLeft,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '19°',
                    style: AppTypography.hugeTitleBold.copyWith(color: AppColors.primary),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'descr',
                    style: AppTypography.captionBold1.copyWith(color: AppColors.tertiary),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'place',
                        style: AppTypography.bodyReg.copyWith(color: AppColors.primary),
                      ),
                      Text(
                        'main dscr',
                        style: AppTypography.footnoteBold.copyWith(color: AppColors.primary),
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  child: Image.asset(
                    '/images/moon_rain.png',
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.strokeWidth = 5;
    paint.shader = AppGradients.purpleDark.createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)));
    paint.style = PaintingStyle.fill;

    final path_0 = Path();

    path_0.moveTo(0, size.height * 0.3796549);
    path_0.cubicTo(0, size.height * 0.1808314, 0, size.height * 0.08141943, size.width * 0.03311696, size.height * 0.02994537);
    path_0.cubicTo(size.width * 0.06623363, size.height * -0.02152880, size.width * 0.1157971, size.height * 0.0008455886, size.width * 0.2149243, size.height * 0.04559434);
    path_0.lineTo(size.width * 0.9003012, size.height * 0.3549931);
    path_0.cubicTo(size.width * 0.9481257, size.height * 0.3765817, size.width * 0.9720351, size.height * 0.3873766, size.width * 0.9860175, size.height * 0.4217320);
    path_0.cubicTo(size.width, size.height * 0.4560880, size.width, size.height * 0.5040491, size.width, size.height * 0.5999714);
    path_0.lineTo(size.width, size.height * 0.7485714);
    path_0.cubicTo(size.width, size.height * 0.8670971, size.width, size.height * 0.9263600, size.width * 0.9811579, size.height * 0.9631771);
    path_0.cubicTo(size.width * 0.9623187, size.height, size.width * 0.9319942, size.height, size.width * 0.8713450, size.height);
    path_0.lineTo(size.width * 0.1286550, size.height);
    path_0.cubicTo(size.width * 0.06800643, size.height, size.width * 0.03768216, size.height, size.width * 0.01884108, size.height * 0.9631771);
    path_0.cubicTo(0, size.height * 0.9263600, 0, size.height * 0.8670971, 0, size.height * 0.7485714);
    path_0.lineTo(0, size.height * 0.3796549);
    path_0.close();

    canvas.drawPath(path_0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

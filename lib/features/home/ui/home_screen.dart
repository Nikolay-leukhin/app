import 'dart:ui';

import 'package:app/features/home/ui/home_page.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/gradients.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> pages = [HomePage(), HomePage(), HomePage()];

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  double height = 0.3;

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
            showModalBottomSheet(
                
                isDismissible: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                context: (context),
                builder: ((context) {
                  return _createBottomSheet(context);
                }));
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

  Widget _createBottomSheet(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => DraggableScrollableSheet(
        builder: (_, context) => AnimatedContainer(
          decoration: BoxDecoration(gradient: AppGradients.purpleDark, borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          duration: Duration(seconds: 10),
          child: Column(children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    if (height == 0.3) {
                      height = 0.9;
                    } else {
                      height = 0.3;
                    }
                  });
                },
                child: Container(
                  width: 20.w,
                  height: 6,
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                ))
          ]),
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

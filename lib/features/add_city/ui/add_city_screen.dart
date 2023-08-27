import 'package:app/features/add_city/data/add_city_repository.dart';
import 'package:app/features/add_city/ui/add_city_card.dart';
import 'package:app/models/city.dart';
import 'package:app/utils/colors.dart';
import 'package:app/utils/fonts.dart';
import 'package:app/utils/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({super.key});

  @override
  State<AddCityScreen> createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  TextEditingController _fieldController = TextEditingController();

  late Future<List<City>?> cityList;

  @override
  void initState() {
    super.initState();
    setState(() {
      cityList = Future.value([]);
    });
  }

  Future<List<City>?> _getCities(text) async {
    if (_fieldController.text.length > 1) {
      final res = await context.read<AddCityRepository>().getCities(text);
      return res.item2;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(gradient: AppGradients.black),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: TextField(
            style: AppTypography.calloutBold.copyWith(color: AppColors.primary),
            cursorColor: AppColors.primary,
            controller: _fieldController,
            onChanged: (String s) async {
              setState(() {
                  cityList = _getCities(s);
              });
            },
            decoration: InputDecoration(
                hintText: 'Search the city',
                hintStyle: AppTypography.calloutReg.copyWith(color: AppColors.primary),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.7),
                  width: 2,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ))),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(alignment: Alignment.topCenter, width: MediaQuery.sizeOf(context).width * 0.8, child: _createCitiesList()),
        ),
      ),
    );
  }

  Widget _createCitiesList() {
    return FutureBuilder(
      future: cityList,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator.adaptive());
          case ConnectionState.done:
            List<City> data = snapshot.data!;
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return AddCityCard(
                      key: ValueKey(data[index]),
                      city: data[index],
                    );
                  },
                  itemCount: data.length);
            } else {
              return Center(
                child: Text('no data', style: AppTypography.largeTitleBold.copyWith(color: AppColors.primary),),
              );
            }
          default:
            return Text('hahaha');
        }
      },
    );
  }
}

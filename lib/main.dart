import 'package:app/app.dart';
import 'package:app/features/add_city/data/add_city_repository.dart';
import 'package:app/features/auth/data/user_repository.dart';
import 'package:app/features/home/cubit/home_cubit.dart';
import 'package:app/features/home/data/home_repository.dart';
import 'package:app/services/api/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  debugProfileBuildsEnabled = true;
  runApp(MyRepositoryProvider());
}

class MyRepositoryProvider extends StatelessWidget {
  final ApiServices apiServ = ApiServices();

  MyRepositoryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => HomeRepository(api: apiServ),
          lazy: false,
        ),
        RepositoryProvider(create: (context) => UserRepository(),
        lazy: false,),
        RepositoryProvider(
          create: (context) => AddCityRepository(apiServ)
        ),
      ],
      child: MyBlocProvider(),
    );
  }
}

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            homeRepository: context.read<HomeRepository>(),
            userRepository: context.read<UserRepository>(),
          ),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

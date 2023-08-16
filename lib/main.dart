import 'package:app/app.dart';
import 'package:app/features/add_city/cubit/add_city_cubit.dart';
import 'package:app/features/add_city/data/add_city_repository.dart';
import 'package:app/features/auth/data/user_repository.dart';
import 'package:app/features/home/cubit/home_cubit.dart';
import 'package:app/features/home/data/home_repository.dart';
import 'package:app/features/search/cubit/search_cubit.dart';
import 'package:app/features/search/data/search_repository.dart';
import 'package:app/services/api/api_services.dart';
import 'package:app/services/local/custom_bloc_observer.dart';
import 'package:app/services/local/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ApiServices apiServ = ApiServices();
final PrefServise pref = PrefServise();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  debugProfileBuildsEnabled = true;
  runApp(MyRepositoryProvider());
}

class MyRepositoryProvider extends StatelessWidget {
  MyRepositoryProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => HomeRepository(api: apiServ),
          lazy: false,
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
          lazy: false,
        ),
        RepositoryProvider(create: (context) => AddCityRepository(apiServ), lazy: false,),
        RepositoryProvider(create: (context) => SearchRepository(apiServ))
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
        BlocProvider(create: (context) => AddCityCubit(pref: pref), lazy: false,),
        BlocProvider(create: (context) => SearchCubit(pref: pref, searchRepository: context.read<SearchRepository>()), lazy: false,)
      ],
      child: MyApp(),
    );
  }
}

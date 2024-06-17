import 'package:adc/flutter_bloc/my_cubit.dart';
import 'package:adc/repository/my_repo.dart';
import 'package:adc/api/web_services.dart';
import 'package:adc/screens/user_registration.dart';
import 'package:adc/screens/welcome_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_field.dart';

const home = '/home';
const welcome = '/';
const register = '/register';

class AppRouting {
  late MyRepo myRepo;
  late MyCubit myCubit;

  AppRouting() {
    myRepo = MyRepo(WebServices(Dio()));
    myCubit = MyCubit(myRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => myCubit,
            child: UserField(),
          ),
        );
      case welcome:
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen(),
        );
    }
  }
}

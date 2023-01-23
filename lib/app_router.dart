import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'Prasintation/screens/activity_screen.dart';
import 'Prasintation/screens/exercises_screen.dart';
import 'Prasintation/screens/home_screen.dart';

import 'Prasintation/screens/login.dart';
import 'Prasintation/screens/sleep_screen.dart';
import 'Prasintation/screens/user_Information_screen.dart';
import 'business_logic/cubit/polar_cubit_cubit.dart';
import 'constant/strings.dart';
import 'data/repository/activityRepository.dart';
import 'data/repository/exercisesRepository.dart';
import 'data/repository/sleepRepository.dart';
import 'data/repository/userInformationRepository.dart';
import 'data/web-server/activityList_web_services.dart';
import 'data/web-server/exercises_web_servises.dart';
import 'data/web-server/sleep_web_services.dart';
import 'data/web-server/userInformation_web_servises.dart';

class AppRouter {
  late UserInformationRepository userInformationRepository;
  late ActivityRepository activityRepository;
  late ExercisesRepository exercisesRepository;
  late PolarCubitCubit polarCubitCubit;
  late SleepRepository sleepRepository;
  AppRouter() {
    userInformationRepository =
        UserInformationRepository(UserInformationWebservices());
    activityRepository = ActivityRepository(ActivityListWebServices());
    exercisesRepository = ExercisesRepository(ExerscisesWebServises());
    sleepRepository = SleepRepository(SleepWebServices());
    polarCubitCubit = PolarCubitCubit(userInformationRepository,
        activityRepository, exercisesRepository, sleepRepository);
  }
  Route? generateRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case '/userInformation':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: UserInfomationScreen(),
          ),
        );
      case '3': // user ifo same
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: UserInfomationScreen(),
          ),
        );
      case Login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => polarCubitCubit,
                  child: LoginScreen1(),
                ));
      case '/home':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => polarCubitCubit,
                  child: HomePage(),
                ));
      case '/activity':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: ActivityScreen(),
          ),
        );
      case '0':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: ActivityScreen(),
          ),
        );
      case '/exercises':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: ExercisesScreen(),
          ),
        );
      case '1': //exercises same
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: ExercisesScreen(),
          ),
        );
      case '/sleep':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: SleepScreen(),
          ),
        );
      case '2': //sleep Same
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => polarCubitCubit,
            child: SleepScreen(),
          ),
        );
    }
  }
}

part of 'polar_cubit_cubit.dart';

@immutable
abstract class PolarCubitState {}

class PolarCubitInitial extends PolarCubitState {}

/*class PolarCubitHomePage extends PolarCubitState {
  final UserInformation userInformation;
  //final List<Activity> activity;
  final List<Exercises> exercises;
  // final Sleep sleep;
  PolarCubitHomePage(this.userInformation, this.exercises);
}*/

class PolarCubitLoaded extends PolarCubitState {
  final UserInformation userInformation;
  PolarCubitLoaded(this.userInformation);
}

class PolarCubitActivity extends PolarCubitState {
  final List<Activity> activity;
  PolarCubitActivity(this.activity);
}

class PolarCubitExercises extends PolarCubitState {
  final List<Exercises> exercises;
  PolarCubitExercises(this.exercises);
}

class PolarCubitSleep extends PolarCubitState {
  final Sleep sleep;
  PolarCubitSleep(this.sleep);
}

/*class PolarInitial extends PolarState {}

class PolarLoaded extends PolarState {
  final UserInformation userInformation;
  PolarLoaded(this.userInformation);
}

class PolarActivity extends PolarState {
  final List<Activity> activity;
  PolarActivity(this.activity);
}

class PolarExercises extends PolarState {
  final List<Exercises> exercises;
  PolarExercises(this.exercises);
}

class PolarSleep extends PolarState {
  final Sleep sleep;
  PolarSleep(this.sleep);
}
*/
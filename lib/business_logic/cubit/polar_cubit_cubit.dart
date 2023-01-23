import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:testflutter/data/models/activity.dart';
import 'package:testflutter/data/models/exercises.dart';
import 'package:testflutter/data/models/sleep.dart';
import 'package:testflutter/data/models/userInformation.dart';
import 'package:testflutter/data/repository/activityRepository.dart';
import 'package:testflutter/data/repository/exercisesRepository.dart';
import 'package:testflutter/data/repository/sleepRepository.dart';
import 'package:testflutter/data/repository/userInformationRepository.dart';

part 'polar_cubit_state.dart';

class PolarCubitCubit extends Cubit<PolarCubitState> {
  final UserInformationRepository userInformationRepository;
  UserInformation? userInformation;

  final ActivityRepository activityRepository;
  List<Activity> activity = [];

  final ExercisesRepository exercisesRepository;
  List<Exercises> exercises = [];

  final SleepRepository sleepRepository;
  Sleep? sleep;

  PolarCubitCubit(this.userInformationRepository, this.activityRepository,
      this.exercisesRepository, this.sleepRepository)
      : super(PolarCubitInitial());

  UserInformation? getAllUserInformation() {
    userInformationRepository.getAllUserInformation().then((userInfo) {
      emit(PolarCubitLoaded(userInfo));
      userInformation = userInfo;
      print(userInfo.firstName);
    });

    return userInformation;
  }

  List<Activity> getAllActivities() {
    activityRepository.getAllActivity().then((act) {
      emit(PolarCubitActivity(act));
      activity = act;
    });
    return activity;
  }

  List<Exercises> getAllExercisses() {
    exercisesRepository.getAllExercises().then((exe) {
      emit(PolarCubitExercises(exe));
      exercises = exe;
    });
    return exercises;
  }

  Sleep? getSleepInformation() {
    sleepRepository.getSleepInformation().then((slp) {
      emit(PolarCubitSleep(slp));
      sleep = slp;
    });
    return sleep;
  }
}

/*abstract class PolarEvent {}

class LoadEvent extends PolarEvent {}

abstract class PolarState {}

class PolarBloc extends Bloc<PolarEvent, PolarState> {
  final UserInformationRepository userInformationRepository;
  UserInformation? userInformation;

  final ActivityRepository activityRepository;
  List<Activity> activity = [];

  final ExercisesRepository exercisesRepository;
  List<Exercises> exercises = [];

  final SleepRepository sleepRepository;
  Sleep? sleep;

  PolarBloc(this.userInformationRepository, this.activityRepository,
      this.exercisesRepository, this.sleepRepository)
      : super(PolarInitial());

  /*@override
  Stream<PolarState> mapEventToState(PolarEvent event) async* {
    if (event is LoadEvent) {
      try {
        userInformation =
            await userInformationRepository.getAllUserInformation();
        yield PolarLoaded(userInformation!);
      } catch (e) {
        print(e);
      }
    }
  }*/
  @override
  Stream<PolarState> on<E extends PolarEvent>(
      EventHandler<E, PolarState> handler,
      {EventTransformer<E>? transformer}) async* {
   
    super.on(handler, transformer: transformer);
    if (E is LoadEvent) {
      try {
        userInformation =
            await userInformationRepository.getAllUserInformation();
        yield PolarLoaded(userInformation!);
      } catch (e) {
        print(e);
      }
    }
  }
}*/

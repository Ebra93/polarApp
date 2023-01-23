import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/polar_cubit_cubit.dart';
import '../../data/models/activity.dart';
import '../../data/models/exercises.dart';
import '../../data/models/sleep.dart';
import '../../data/models/userInformation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserInformation? allUserInformations;

  late List<Exercises>? exercises;
  late Sleep? sleep;
  late List<Activity>? activity;

  @override
  void initState() {
    super.initState();
    allUserInformations =
        BlocProvider.of<PolarCubitCubit>(context).getAllUserInformation();
    sleep = BlocProvider.of<PolarCubitCubit>(context).getSleepInformation();
    exercises = BlocProvider.of<PolarCubitCubit>(context).getAllExercisses();
    activity = BlocProvider.of<PolarCubitCubit>(context).getAllActivities();
  }

  Widget buildLoadedListWidgets() {
    return Container(
      //To do Data Visualisieren
      child: Container(
        child: Text("///" +
            allUserInformations!.firstName +
            "///" +
            sleep!.nights.first.deviceId +
            "///" +
            exercises!.first.id.toString() +
            '///' +
            activity.toString()),
      ),
    );
  }

  Widget buildBlocWidget() {
    int x = 0;
    return BlocBuilder<PolarCubitCubit, PolarCubitState>(
      builder: (context, state) {
        if (state is PolarCubitLoaded) {
          x++;
          allUserInformations = (state).userInformation;
        } else if (state is PolarCubitExercises) {
          x++;
          exercises = (state).exercises;
        } else if (state is PolarCubitSleep) {
          x++;
          sleep = (state).sleep;
        } else if (state is PolarCubitActivity) {
          x++;
          activity = (state).activity;
        }

        if (x == 4) {
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomePage',
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}

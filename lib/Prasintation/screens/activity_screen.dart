import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iso_duration_parser/iso_duration_parser.dart';

import '../../business_logic/cubit/polar_cubit_cubit.dart';
import '../../constant/strings.dart';
import '../../data/models/activity.dart';
import '../widget/footer.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  late List<Activity> activity;
  @override
  void initState() {
    super.initState();
    activity = BlocProvider.of<PolarCubitCubit>(context).getAllActivities();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<PolarCubitCubit, PolarCubitState>(
      builder: (context, state) {
        if (state is PolarCubitActivity) {
          activity = (state).activity;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: mycolor1,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 20,
                        blurRadius: 10,
                        color: black.withOpacity(0.01),
                        offset: Offset(0, 1))
                  ]),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  'All Activities',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
              child: Column(
                  children: List.generate(activity.length, (index) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: sleeprate[5]['color']),
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date:  ' + activity[index].date,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Duration:   ' +
                                IsoDuration.parse(activity[index].duration)
                                    .hours
                                    .toInt()
                                    .toString() +
                                "h " +
                                IsoDuration.parse(activity[index].duration)
                                    .minutes
                                    .toInt()
                                    .toString() +
                                "m " +
                                IsoDuration.parse(activity[index].duration)
                                    .seconds
                                    .toInt()
                                    .toString() +
                                "s",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Active Calories:     ' +
                                activity[index].activeCalories.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time:   ' +
                                activity[index]
                                    .created
                                    .split('T')[1]
                                    .split('.')[0],
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Calories:    ' +
                                activity[index].calories.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Active Steps:        ' +
                                activity[index].activeSteps.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          })))
        ],
      ),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activity',
        ),
      ),
      body: buildBlocWidget(),
      bottomNavigationBar: getFooter(0, 0, context),
    );
  }
}

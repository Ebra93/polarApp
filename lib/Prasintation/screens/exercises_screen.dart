import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:testflutter/Prasintation/widget/footer.dart';
import 'package:testflutter/business_logic/cubit/polar_cubit_cubit.dart';

import '../../constant/strings.dart';
import '../../data/models/exercises.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late List<Exercises> exercises;

  @override
  void initState() {
    super.initState();
    exercises = BlocProvider.of<PolarCubitCubit>(context).getAllExercisses();
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: sleeprate[5]['color']),
              borderRadius: BorderRadius.circular(30)),
          width: double.infinity,
          child: const Text(
            'Training session summary data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
            children: List.generate(exercises.length, (index) {
          return Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: sleeprate[5]['color']),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Your exercises ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text('am: ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Text(
                              exercises[index].startTime.split('T')[0],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 193, 53, 43)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              'at: ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(exercises[index].startTime.split('T')[1],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 193, 53, 43))),
                          ],
                        ),
                      ],
                    ),
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text('Distance ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  if (exercises[index].distance.toString() ==
                                      'null') ...[
                                    const Text('0',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 193, 53, 43))),
                                  ] else ...[
                                    Text(exercises[index].distance.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 193, 53, 43))),
                                  ],
                                ],
                              ),
                              const Text(' m',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                      Text('Duration  ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          exercises[index]
                                  .duration
                                  .split('T')[1]
                                  .split('.')[0] +
                              ' s',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 193, 53, 43)))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Calories         ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(exercises[index].calories.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 193, 53, 43))),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Sport   ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(exercises[index].sport,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 193, 53, 43))),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('detailed Sport   ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(exercises[index].detailedSportInfo,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 193, 53, 43)))
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Heartrate While your exercises',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                              width: 190,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: const LinearGradient(colors: <Color>[
                                  Color.fromARGB(255, 82, 169, 239),
                                  Color.fromARGB(255, 95, 176, 242)
                                ]),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    LineIcons.heartbeat,
                                    size: 35,
                                    color: Color.fromARGB(255, 140, 17, 17),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'averag    ' +
                                              exercises[index]
                                                  .heartRate
                                                  .average
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                          'maximum  ' +
                                              exercises[index]
                                                  .heartRate
                                                  .maximum
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ]);
        }))
      ],
    ));
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<PolarCubitCubit, PolarCubitState>(
      builder: (context, state) {
        if (state is PolarCubitExercises) {
          exercises = (state).exercises;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercises',
        ),
      ),
      body: buildBlocWidget(),
      bottomNavigationBar: getFooter(1, 1, context),
    );
  }
}

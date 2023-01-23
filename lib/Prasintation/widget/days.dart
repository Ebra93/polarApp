import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testflutter/Prasintation/widget/chart_heart_rate.dart';
import 'package:testflutter/Prasintation/widget/sleepElemwnt.dart';
import 'package:testflutter/Prasintation/widget/test.dart';
import 'package:testflutter/constant/strings.dart';
import 'package:testflutter/data/models/sleep.dart';

import 'hypnogrram.dart';

Widget days(Sleep sleep, BuildContext context, var size) {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  return Column(
    children: [
      Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 20,
                    blurRadius: 10,
                    color: black.withOpacity(0.01),
                    offset: const Offset(0, 1))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Tooltip(
                    message:
                        'when you choose a day ,you will see all Sleep informationen about this day ',
                    verticalOffset: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          colors: <Color>[Colors.amber, Colors.red]),
                    ),
                    height: 50,
                    padding: const EdgeInsets.all(8.0),
                    preferBelow: false,
                    textStyle: const TextStyle(
                      fontSize: 24,
                    ),
                    showDuration: const Duration(seconds: 4),
                    waitDuration: const Duration(seconds: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Days ',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Icon(IconData(0xe0b7, fontFamily: 'MaterialIcons'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(sleep.nights.length, (index) {
                            return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onLongPress: () {},
                                      child: Column(
                                        children: [
                                          Text(sleep.nights[index].date
                                              .split('2022-')[1]),
                                          const SizedBox(height: 10),
                                          InkWell(
                                              onTap: (() {
                                                _counter.value = index;
                                              }),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                        color: bgTextField,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                  ),
                                                  // activity bar
                                                  Positioned(
                                                    bottom: 0,
                                                    child: Container(
                                                      width: 20,
                                                      height: 120 *
                                                          (sleep.nights[index]
                                                                  .lightSleep +
                                                              sleep
                                                                  .nights[index]
                                                                  .deepSleep +
                                                              sleep
                                                                  .nights[index]
                                                                  .remSleep) /
                                                          sleep.nights[index]
                                                              .sleepGoal,
                                                      decoration: BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: sleepgool[
                                                                  0]['color']),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Text(
                                            DateFormat('EEEE')
                                                .format(DateTime.parse(
                                                    sleep.nights[index].date))
                                                .substring(0, 3),
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          }),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '    Choose The Day to update his Information        ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )),
      const SizedBox(
        height: 50,
      ),
      Container(
        width: (size.width - 50),
        height: 400,
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 20,
                  blurRadius: 10,
                  offset: const Offset(0, 10))
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ValueListenableBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  // This builder will only get called when the _counter
                  // is updated.
                  return Flexible(
                      child: Column(
                    children: [
                      Text(
                        sleep.nights[value].date.split('2022-')[1],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Heart rate while sleeping ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        child:
                            sleeppionts(sleep.nights[value].heartRateSamples),
                      ),
                      /*LineChartWidget(
                        points:
                            heartpoints(sleep.nights[value].heartRateSamples),
                      ),*/
                    ],
                  ));
                },
                valueListenable: _counter,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      Container(
        width: (size.width - 50),
        height: 300,
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 20,
                  blurRadius: 10,
                  offset: const Offset(0, 10))
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Tooltip(
                message:
                    'The time span between when you fell asleep and when you woke up is classified into light, deep or REM sleep, or unrecognised or wake in 30-s epochs.  WAKE, REM,  LIGHTER NON-REM, LIGHT NON-REM,  DEEP NON-REM,  UNKNOWN .',
                verticalOffset: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: sleeprate[1]['color']),
                ),
                height: 50,
                padding: const EdgeInsets.all(8.0),
                preferBelow: false,
                textStyle: const TextStyle(
                  fontSize: 24,
                ),
                showDuration: const Duration(seconds: 4),
                waitDuration: const Duration(seconds: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Sleep Mode   ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Icon(IconData(0xe0b7, fontFamily: 'MaterialIcons'))
                  ],
                ),
              ),
              ValueListenableBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  // This builder will only get called when the _counter
                  // is updated.
                  return Flexible(
                    child: (hypnogram(sleep.nights[value].hypnogram)),
                  );
                },
                valueListenable: _counter,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sleepart('WAKE', 'WAKE  ', 0),
                  sleepart(
                      'Total time in seconds spent in REM sleep stage between ' +
                          'when you fell asleep and when you woke up. REM stands for rapid eye movement.',
                      'rem sleep  ',
                      1),
                  sleepart(
                      'Total time in seconds spent in REM sleep stage between ' +
                          'when you fell asleep and when you woke up. REM stands for rapid eye movement.',
                      'LIGHTER NON-REM  ',
                      2),
                  sleepart(
                      'Total time in seconds spent in light sleep ' +
                          'stage between when you fell asleep and when you woke up. ' +
                          'Corresponds to N1+ N2 according to AASM classification.',
                      'light sleep  ',
                      3),
                  sleepart(
                      'Total time in seconds spent in the deep' +
                          ' sleep stage between when you fell asleep and when ' +
                          'you woke up. Corresponds to N3 according to AASM classification.',
                      'deep sleep  ',
                      4),
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      Container(
        width: (size.width - 50),
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 20,
                  blurRadius: 10,
                  offset: Offset(0, 10))
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "more Information about your sleep",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ValueListenableBuilder<int>(
              builder: (BuildContext context, int value, Widget? child) {
                // This builder will only get called when the _counter
                // is updated.
                return Column(
                  children: [
                    Container(
                        height: 400,
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: (4),
                          ),
                          children: [
                            SleepElement(
                              title: 'Sleep start Time',
                              mesgese: 'Start timestamp of the sleep ',
                              info: sleep.nights[value].sleepStartTime
                                  .split('T')[1]
                                  .split('.')[0],
                              mycolor: 0,
                            ),
                            SleepElement(
                                title: 'Sleep end Time  ',
                                mesgese: 'End timestamp of the sleep',
                                info: sleep.nights[value].sleepEndTime
                                    .split('T')[1]
                                    .split('.')[0],
                                mycolor: 1),
                            SleepElement(
                                title: 'Continuity',
                                mesgese: 'Continuity is an estimate of how continuous the ' +
                                    'sleep was on a scale of 1.0 – 5.0, where 5.0 reflects uninterrupted sleep.' +
                                    ' The lower the value the more fragmented the sleep was.',
                                info: sleep.nights[value].continuity.toString(),
                                mycolor: 2),
                            SleepElement(
                                title: 'Continuity Class',
                                mesgese: 'Verbal assessments of sleep continuity Very continuous sleep ' +
                                    '(5) Continuous sleep (4) Fairly continuous sleep (3) Fairly' +
                                    ' fragmented sleep (2) Fragmented sleep (1)',
                                info: sleep.nights[value].continuityClass
                                    .toString(),
                                mycolor: 3),
                            SleepElement(
                                title: 'Light Sleep',
                                mesgese: 'Total time in seconds spent in light sleep ' +
                                    'stage between when you fell asleep and when you woke up. ' +
                                    'Corresponds to N1+ N2 according to AASM classification.',
                                info: sleep.nights[value].lightSleep.toString(),
                                mycolor: 0),
                            SleepElement(
                                title: 'Deep Sleep',
                                mesgese: 'Total time in seconds spent in the deep' +
                                    ' sleep stage between when you fell asleep and when ' +
                                    'you woke up. Corresponds to N3 according to AASM classification.',
                                info: sleep.nights[value].deepSleep.toString(),
                                mycolor: 1),
                            SleepElement(
                                title: 'Rem Sleep',
                                mesgese:
                                    'Total time in seconds spent in REM sleep stage between ' +
                                        'when you fell asleep and when you woke up. REM stands for rapid eye movement.',
                                info: sleep.nights[value].remSleep.toString(),
                                mycolor: 0),
                            SleepElement(
                                title: 'unrecognized Sleep Stage',
                                mesgese: '	Total time in seconds spent in unrecognised sleep stage.' +
                                    ' Sometimes its impossible to recognize sleep stages. This might' +
                                    ' happen when, for example, the wrist strap is not tight enough, ' +
                                    'or if you sleep on your hand.',
                                info: sleep.nights[value].unrecognizedSleepStage
                                    .toString(),
                                mycolor: 1),
                            SleepElement(
                                title: 'Sleep Score',
                                mesgese: 'Sleep score summarizes the amount and quality of your' +
                                    ' sleep into a single number on a scale of 1 – 100. Sleep' +
                                    ' score tells you how well you slept compared to the indicators ' +
                                    'of a good nights sleep based on the current sleep science.' +
                                    ' It consists of six components; sleep time, long interruptions,' +
                                    ' continuity, actual sleep, REM sleep, and deep sleep.',
                                info: sleep.nights[value].sleepScore.toString(),
                                mycolor: 0),
                            SleepElement(
                                title: 'total Interruption Duration ',
                                mesgese:
                                    'The total time in seconds you spent awake between when you' +
                                        ' fell asleep and when you woke up.',
                                info: sleep
                                    .nights[value].totalInterruptionDuration
                                    .toString(),
                                mycolor: 1),
                            SleepElement(
                                title: 'Sleep Charge',
                                mesgese: 'Sleep score compared to your usual level from the past 28' +
                                    ' days.Scale: much below usual (1) – below usual (2) – usual ' +
                                    '(3) – above usual (4) – much above usual(5).',
                                info:
                                    sleep.nights[value].sleepCharge.toString(),
                                mycolor: 0),
                            SleepElement(
                                title: 'Sleep Rating',
                                mesgese: 'Numeric value given by user for representing the quality' +
                                    ' of sleep. Selection scale: Very poorly(1), poorly(2), ok(3),' +
                                    ' well(4), very well(5). 0 means no value is given.',
                                info: sleep_rating[
                                    sleep.nights[value].sleepRating],
                                mycolor: 1),
                            SleepElement(
                                title: 'Sleep Goal',
                                mesgese:
                                    'Time goal in seconds for sleep selectedby user. A default' +
                                        ' value of the setting is based on age-related sleep ' +
                                        'duration recommendations.',
                                info: sleep.nights[value].sleepGoal.toString(),
                                mycolor: 0),
                            SleepElement(
                                title: 'short Interruption Duration ',
                                mesgese:
                                    'Total time in seconds of short interruptions. Short' +
                                        ' interruption is interruption in sleep of less than 90 seconds.',
                                info: sleep
                                    .nights[value].shortInterruptionDuration
                                    .toString(),
                                mycolor: 1),
                            SleepElement(
                                title: 'long nterruption Duration',
                                mesgese:
                                    '	Total time in seconds of long interruptions. Long interruption ' +
                                        'is interruption in sleep of 90 seconds or more.',
                                info: sleep
                                    .nights[value].longInterruptionDuration
                                    .toString(),
                                mycolor: 0),
                            SleepElement(
                                title: 'Sleep Sycles',
                                mesgese: 'Number of sleep cycles.',
                                info:
                                    sleep.nights[value].sleepCycles.toString(),
                                mycolor: 1),
                            SleepElement(
                                title: 'group Duration Score',
                                mesgese: 'Sleep score consists of six components that are grouped under' +
                                    ' three themes. Score for sleep duration theme looks at your ' +
                                    'sleep time compared to your preferred sleep time setting and ' +
                                    'the age-related duration recommendations. Group duration score' +
                                    ' ranges from 1.0 to 100.0. It is interpreted as textual feedback:' +
                                    ' poor, moderate or good amount.',
                                info: sleep.nights[value].groupDurationScore
                                    .toString(),
                                mycolor: 0),
                            SleepElement(
                                title: 'group Solidity Score',
                                mesgese: 'Sleep score consists of six components that are grouped' +
                                    ' under three themes. Score for sleep solidity theme is the' +
                                    ' average of the component scores of long interruptions, ' +
                                    'continuity and actual sleep. Group solidity score ranges' +
                                    ' from 1.0 to 100.0. It is interpreted as textual feedback: ' +
                                    'poor, moderate or good solidity.',
                                info: sleep.nights[value].groupSolidityScore
                                    .toString(),
                                mycolor: 1),
                            SleepElement(
                                title: 'group Regeneration Score ',
                                mesgese: 'Sleep score consists of six components that are grouped ' +
                                    'under three themes. Score for regeneration theme is the ' +
                                    'average of the scores of REM sleep and deep sleep. Group' +
                                    ' regeneration score ranges from 1.0 to 100.0. It is ' +
                                    'interpreted as textual feedback: poor, moderate or good ' +
                                    'regeneration',
                                info: sleep.nights[value].groupRegenerationScore
                                    .toString(),
                                mycolor: 0),
                          ],
                        )),
                  ],
                );
              },
              valueListenable: _counter,
            ),
          ],
        ),
      ),
    ],
  );
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/polar_cubit_cubit.dart';
import '../../data/models/sleep.dart';
import '../widget/days.dart';
import '../widget/footer.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({Key? key}) : super(key: key);

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  late Sleep? sleep;

  @override
  void initState() {
    super.initState();
    sleep = BlocProvider.of<PolarCubitCubit>(context).getSleepInformation();
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListWidgets(
    BuildContext context,
  ) {
    var size = MediaQuery.of(context).size;
    int x = 0;
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(child: days(sleep!, context, size)),
        ],
      )

          //child: (Text(sleep!.nights.first.polarUser)),
          ),
    );
  }

  Widget buildBlocWidget(BuildContext context) {
    return BlocBuilder<PolarCubitCubit, PolarCubitState>(
      builder: (context, state) {
        if (state is PolarCubitSleep) {
          sleep = (state).sleep;
          return buildLoadedListWidgets(context);
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
          'Sleep Information',
        ),
      ),
      body: buildBlocWidget(context),
      bottomNavigationBar: getFooter(2, 2, context),
    );
  }
}

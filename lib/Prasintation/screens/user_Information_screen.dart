import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testflutter/Prasintation/widget/UserInformation_item.dart';
import 'package:testflutter/Prasintation/widget/footer.dart';
import 'package:testflutter/business_logic/cubit/polar_cubit_cubit.dart';
import 'package:testflutter/constant/strings.dart';

import '../../data/models/userInformation.dart';

class UserInfomationScreen extends StatefulWidget {
  const UserInfomationScreen({Key? key}) : super(key: key);

  @override
  State<UserInfomationScreen> createState() => _UserInfomationScreenState();
}

class _UserInfomationScreenState extends State<UserInfomationScreen> {
  late UserInformation? allUserInformations;

  @override
  void initState() {
    super.initState();
    allUserInformations =
        BlocProvider.of<PolarCubitCubit>(context).getAllUserInformation();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<PolarCubitCubit, PolarCubitState>(
      builder: (context, state) {
        if (state is PolarCubitLoaded) {
          allUserInformations = (state).userInformation;
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

  Widget buildLoadedListWidgets() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('    Last Name',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                  allUserInformations!.lastName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('First Name',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(allUserInformations!.firstName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient:
                  const LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Gender   ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(allUserInformations!.gender,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('    Birth date',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(allUserInformations!.birthdate,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Registration Date',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(allUserInformations!.registrationDate.split('T')[0],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient:
                  const LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Height    ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(allUserInformations!.height.toString() + ' cm',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient:
                  const LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Weight     ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(allUserInformations!.weight.toString() + ' kg',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient:
                  const LinearGradient(colors: <Color>[mycolor1, mycolor1]),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Polar User Id  ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(allUserInformations!.polarUserId.toString(),
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            )),
      ],
    ));
  }

  Widget buildUserInformationList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return UserInformationItem();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Information',
        ),
      ),
      body: buildBlocWidget(),
      bottomNavigationBar: getFooter(3, 3, context),
    );
  }
}

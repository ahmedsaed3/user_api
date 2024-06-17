import 'package:adc/flutter_bloc/my_state.dart';
import 'package:adc/flutter_bloc/my_cubit.dart';
import 'package:adc/models/users.dart';
import 'package:flutter/material.dart ';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/my_repo.dart';

class UserField extends StatefulWidget {
  @override
  State<UserField> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<UserField> {
  late List<Users> Listusers = [];
  late MyRepo myRepo;
  late MyCubit myCubit;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<MyCubit>(context).emitGetAllUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Data Of Users"),
      ),
      body: Column(children: [
        BlocBuilder<MyCubit, MyState>(builder: (context, state) {
          if (state is UsersLoaded) {
            Listusers = (state).getallusers;
            return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: Listusers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.black12,
                    child: Center(
                      child: Text(Listusers[index].name.toString()),
                    ),
                  );
                });
          } else {
            return Column(
              children: [
                Center(
                    child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                )),
              ],
            );
          }
        })
      ]),
    );
  }
}

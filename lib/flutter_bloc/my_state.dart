import 'package:adc/models/users.dart';
abstract class MyState{}
class MyInitial extends MyState{}
class UsersLoaded extends MyState{
  final List<Users> getallusers;
  UsersLoaded(this.getallusers);
}

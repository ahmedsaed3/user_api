
import 'package:adc/flutter_bloc/my_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/my_repo.dart';


class MyCubit extends Cubit<MyState>{
  final MyRepo myRepo;
  MyCubit(this.myRepo): super(MyInitial());
void emitGetAllUsers(){
  myRepo.GetAllUsers().then((usersList){
    emit(UsersLoaded(usersList));

  });

}


}
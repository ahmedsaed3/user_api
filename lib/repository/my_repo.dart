
import 'package:adc/models/users.dart';
import 'package:adc/api/web_services.dart';


class MyRepo {
  var token ='834b531f2a953925b328f40a024e6812072ffd166397d2332d9719a56ba56aca';
final WebServices webServices;
MyRepo(this.webServices);// to use that object
Future<List<Users>>GetAllUsers()async{
  var response = await webServices.GetAllUsers();
  return response.map((SingleUser ) => Users.fromJson(SingleUser.toJson())).toList();

}


Future<Users> createNewUser(Users newuser) async{
 return await webServices.createNewUser(newuser, ' Bearer 834b531f2a953925b328f40a024e6812072ffd166397d2332d9719a56ba56aca');

}

Future<dynamic> deleteUser( int id) async{
  return await webServices.deleteUser(id, ' Bearer $token');
}
}
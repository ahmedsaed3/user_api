
import 'dart:io';

import 'package:adc/models/users.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'web_services.g.dart';
@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {

  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
@GET('users')
Future<List<Users>> GetAllUsers();


  @GET('users/{id}')
Future<Users> getUserById(@Path()int id);
@POST('users')
  Future<Users> createNewUser(@Body() Users newuser, @Header('Authorization') String token );
@DELETE('users/{id }')
  Future<dynamic> deleteUser(@Path() int id,@Header('Authorization') String token);



}
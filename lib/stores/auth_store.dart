import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:suggest/utils/constants.dart';

class AuthStore {
  final Dio client = new Dio();
  var msg = Observable('');

  Action authenticate;

  Future<void> signIn(login) async {
    try{
      await client.post(
        "$BASE_API_URL/auth/sign-in",
        data: json.encode({
          "email": login['email'],
          "password": login['password'],
        }),
      ).then((response) => {
        msg.value = response.data,
      });
    }catch(e){
      msg.value = "Login inválido.";
      print(e);
    }
  }
}

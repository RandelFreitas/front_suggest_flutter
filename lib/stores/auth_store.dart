import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:suggest/utils/constants.dart';
import 'package:suggest/utils/request_interceptors.dart';
import '../main.dart';

class AuthStore{
  final Dio client = getDio();
  var msg = Observable('');

  Future<void> signIn(login) async {
    msg.value = null;
    try{
      await client.post("$BASE_API_URL/auth/sign-in",
        data: json.encode({
          "email": login['email'],
          "password": login['password'],
        }),
      ).then((response) async {
        sp.setString('token', response.data['token']);
        sp.setString('name', response.data['name']);
      });
    }catch(e){
      msg.value = e.response.data['err'];
    }
  }

  void logout() {
    try{
      sp.clear();
    }catch(e){
      msg.value = "Erro no logout.";
    }
  }
}

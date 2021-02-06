import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suggest/utils/constants.dart';
import 'package:suggest/utils/request_interceptors.dart';

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
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['token']);
      });
    }catch(e){
      msg.value = e.response.data['err'];
    }
  }
}

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:suggest/utils/constants.dart';
import 'package:suggest/utils/request_interceptors.dart';

class CompanyStore{
  final Dio client = getDio();
  var msg = Observable('');

  Future<void> getCompanies() async {
    msg.value = null;
    try{
      await client.get("$BASE_API_URL/adm/company")
        .then((response) async {
          print(response.data);
        },
      );
    }catch(e){
      msg.value = e.response.data['err'];
    }
  }
}
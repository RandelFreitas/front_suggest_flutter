import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:suggest/utils/constants.dart';
import 'package:suggest/utils/request_interceptors.dart';

class CompanyStore{
  final Dio client = getDio();
  var listCompany = ObservableList<Map>();
  var msg = Observable('');

  Future<void> getCompanies() async {
    listCompany.clear();
    msg.value = null;
    try{
      Response response = await client.get("$BASE_API_URL/adm/company");

      (response.data).map((value) => listCompany.add(value)).toList();
    }catch(e){
      print(e);
      msg.value = e.response.data['err'];
    }
  }
}
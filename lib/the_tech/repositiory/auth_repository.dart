import 'package:np/the_tech/data/network/baseapi_services.dart';
import 'package:np/the_tech/data/network/network_api_services.dart';
import 'package:np/the_tech/res/components/app_url.dart';

class AuthRepository {
  BaseapiServices services = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await services.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await services.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}

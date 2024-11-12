import 'package:np/the_tech/model/user_post.dart';

import '../data/network/baseapi_services.dart';
import '../data/network/network_api_services.dart';
import '../res/components/app_url.dart';

class HomeRepository {
  BaseapiServices services = NetworkApiServices();

  Future<User> fetchUserList() async {
    try {
      dynamic response = await services.getGetApiResponse(
        AppUrl.userUrl,
      );
      return response = User.fromJson(response);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}

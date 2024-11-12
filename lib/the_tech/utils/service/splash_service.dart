import 'package:flutter/material.dart';
import 'package:np/the_tech/model/user_model.dart';
import 'package:np/the_tech/utils/routes/routes_name.dart';
import 'package:np/the_tech/view_model/user_view_model.dart';

class SplashService {
  Future<userModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == null || value.token!.isEmpty) {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (routes) => false);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (routes) => false);
      }
    }).onError((error, strackError) {});
  }
}

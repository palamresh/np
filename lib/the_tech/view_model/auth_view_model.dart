import 'package:flutter/material.dart';
import 'package:np/the_tech/model/user_model.dart';
import 'package:np/the_tech/repositiory/auth_repository.dart';
import 'package:np/the_tech/utils/routes/routes_name.dart';
import 'package:np/the_tech/utils/utils.dart';
import 'package:np/the_tech/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _registerLoading = false;
  bool get registerLoading => _registerLoading;

  void registerSetValue(bool value) {
    _registerLoading = value;
    notifyListeners();
  }

  void setValue(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _auRipo = AuthRepository();

  Future loginApi(dynamic data, BuildContext context) async {
    setValue(true);
    _auRipo.loginApi(data).then((value) {
      setValue(false);
      Utils.toastMessage("login successful");
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (routes) => false);
      print(value.toString());
      final userProvieer = Provider.of<UserViewModel>(context, listen: false);
      userProvieer.saveUser(userModel(token: value['token'].toString()));
    }).onError((error, trackError) {
      setValue(false);
      print(error.toString());
      Utils.toastMessage("login failed");
    });
  }

  Future registerApi(dynamic data, BuildContext context) async {
    registerSetValue(true);
    _auRipo.registerApi(data).then((value) {
      registerSetValue(false);
      Utils.toastMessage("register successful");
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.login, (routes) => false);
      print(value.toString());
    }).onError((error, trackError) {
      registerSetValue(false);
      print(error.toString());
      Utils.toastMessage("login failed");
    });
  }
}

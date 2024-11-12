import 'package:flutter/material.dart';

import 'package:np/the_tech/data/response/api_response.dart';
import 'package:np/the_tech/repositiory/home_repository.dart';

import '../model/user_post.dart';

class HomeViewModel with ChangeNotifier {
  final _myhome = HomeRepository();

  ApiResponse<User> userList = ApiResponse.loading();

  setUserList(ApiResponse<User> response) {
    userList = response;

    notifyListeners();
  }

  Future<void> fetchUserList() async {
    setUserList(ApiResponse.loading());
    _myhome.fetchUserList().then((value) {
      setUserList(ApiResponse.completed(value));
    }).onError((error, strakError) {
      setUserList(ApiResponse.error(error.toString()));
    });
  }
}

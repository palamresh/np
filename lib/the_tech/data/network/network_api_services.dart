import 'dart:convert';
import 'dart:io';

import 'package:np/the_tech/data/app_exception.dart';
import 'package:np/the_tech/data/network/baseapi_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseapiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error During Communication " + response.statusCode.toString());
    }
  }
}

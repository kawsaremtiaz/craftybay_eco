import 'dart:convert';
import 'dart:developer';

import 'package:craftybay/data/models/response_data.dart';
import 'package:craftybay/presentation/state_holders/catch_auth_controller.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<ResponseData> getRequest(String url, {String? token}) async {
    log(url);
    log(token.toString());
    final Response response = await get(
      Uri.parse(url),
      headers: {
        "token": (token ?? CatchAuthController.token).toString(),
        "content-type": "application/json",
      },
    );
    log(response.headers.toString());
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse["msg"] == "success") {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: 'Something went wrong',
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      }
    }else if(response.statusCode == 401){
      CatchAuthController.goToLogin();
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }

  Future<ResponseData> postRequest({required String url,
      required String body, String? token}) async {
    log(url);
    log(token.toString());
    log(body.toString());
    final Response response = await post(
      Uri.parse(url),
      headers: {
        "token": token.toString(),
      },
      body: body,
    );
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      if (decodedResponse["msg"] == "success") {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: 'Something went wrong',
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      }
    }else if(response.statusCode == 401){
      await CatchAuthController.clearAuthData();
      CatchAuthController.goToLogin();
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }
}

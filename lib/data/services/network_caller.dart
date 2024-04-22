import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url,) async {
    log(url);

    Response response = await get(Uri.parse(url),);
    log(response.statusCode.toString());
    log(response.body.toString());
    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 && decodedResponse["msg"] == "success") {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );
    } else if(response.statusCode == 401){

      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        msg: decodedResponse['data'],
      );
    }else {
      return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          msg: decodedResponse['data'] ?? 'Something Went Wrong');
    }
  }

  Future<NetworkResponse> postRequest(String url,
      {Map<String,dynamic>? body}) async {
                                                                                log(url);
                                                                                log(body.toString());
    Response response = await post(Uri.parse(url),
        body: jsonEncode(body),
      );
                                                                                log(response.statusCode.toString());
                                                                                log(response.body.toString());

    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 ) {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );
    } else if (response.statusCode == 401) {

      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        msg: 'Incorrect Email or password!',
      );
    } else {
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        msg:'Something went wrong!',
      );
    }
  }
}
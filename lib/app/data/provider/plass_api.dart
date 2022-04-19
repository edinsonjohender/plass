
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/responseModel.dart';
 
import '../../utils/snackbar.dart';
import '../../utils/constants.dart';
import '../../utils/consolePrint.dart';
import '../model/responseOnErrorModel.dart';

class PlassApi {

  static Future<dynamic> post({
    required String path, 
    required Object body, 
    required String token,
  })  async {
    http.Client client   = http.Client();
    http.Request request = http.Request('POST', Uri.parse(Constants.firebaseUrl + path + '?key=${Constants.firebaseToken}'));
    request.headers[HttpHeaders.contentTypeHeader] = 'application/json; charset=utf-8';
    request.body = json.encode(body);

    try {
      var        res = await client.send(request).timeout( const Duration(seconds: 30));
      final response = await http.Response.fromStream(res);
      return _returnResponse(response, path);
    }  on SocketException {
      return _returnResponse(null, path);
    }on TimeoutException  {
      return _returnResponse(null, path);
    }
  }

  static Future<dynamic> get({
      required String path, 
      required String token, 
      required String code
  }) async {
    http.Client client   = http.Client();
    http.Request request = http.Request('Get',  Uri.parse(Constants.firebaseUrl + path + '?key=${Constants.firebaseToken}'));
    request.headers[HttpHeaders.contentTypeHeader] = 'application/json; charset=utf-8';

    try {
      var        res = await client.send(request).timeout( const Duration(seconds: 30));
      final response = await http.Response.fromStream(res);
      return _returnResponse(response, path);
    }  on SocketException {
      return _returnResponse(null, path);
    }on TimeoutException  {
      return _returnResponse(null, path);
    }
  }


  static _returnResponse(response, path) {
  
    ResponseMododel _response = ResponseMododel();
    ResponseOnError _responseOnError = ResponseOnError();
    int _statusCode = 0;

    if(response != null){
       Print.log(path, response.body, response.statusCode);
      _statusCode = response.statusCode;
      if(_statusCode == 200){
        _response = ResponseMododel.fromJson(json.decode(response.body.toString()));
      }else{
        _responseOnError = ResponseOnError.fromJson(json.decode(response.body.toString()));
      }
    }else{
       _statusCode = 500;
      _responseOnError =  ResponseOnError(
        error: ResponseOnErrorError(message: 'No se Pudo Conectar al servidor')

      );
    }

    switch (_statusCode) {
      case 200:
        return _response;
      case 400:
        MainSnackBar.show(false,  'Solicitud Invalidad:', _responseOnError.error!.message!);
        return  _responseOnError;
      case 401:
      case 403:
      case 422:
        MainSnackBar.show(false, 'Error:', _responseOnError.error!.message!);
        return  _responseOnError;
      case 500:
      default:
        MainSnackBar.show(false,'Error:', _responseOnError.error!.message!);
        return _responseOnError;
    }
  }
}


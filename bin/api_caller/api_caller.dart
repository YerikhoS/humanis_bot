import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'network_exception.dart';

class ApiCaller {
  static const String baseUrl = 'https://api.humanis.id';
 

  

  Future<dynamic> get(String url, Map<String, dynamic>? param, {required String token}) async {
    dynamic responseJson;
    try {

      print('$baseUrl/$url');
      print(param);
      String queryString = Uri(queryParameters: param).query;
      final Uri uri = Uri.parse('$baseUrl/$url?$queryString');
      final http.Response response = await http.get(
        uri,
        headers: <String, String>{HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, dynamic>? body, {required String token}) async {
    dynamic responseJson;
    try {

      print('$baseUrl/$url');
      print(body);
      final Uri uri = Uri.parse('$baseUrl/$url');
      final http.Response response = await http.post(uri, body: body, headers: <String, String>{HttpHeaders.authorizationHeader: 'Bearer $token'},);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // Future<dynamic> postMultipart(String url, String filename, File imageFile) async {
  //   dynamic responseJson;
  //   try {
  //     print('$baseUrl/$url');
  //     final Uri uri = Uri.parse('$baseUrl/$url');
  //     var stream = http.ByteStream(imageFile.openRead());
  //     stream.cast();
  //     var length = await imageFile.length();
  //     var request = http.MultipartRequest('POST', uri);
  //     var multipartFile = http.MultipartFile('file', stream, length, filename: filename);
  //     request.files.add(multipartFile);
  //     final streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  // Future<dynamic> delete(String url, Object body) async {
  //   String responseJson;
  //   try {
  //     print('$baseUrl/$url');
  //     print(body);
  //     final Uri uri = Uri.parse('$baseUrl/$url');
  //     final http.Response response = await http.delete(uri, body: body, headers: <String, String>{HttpHeaders.authorizationHeader: 'Bearer ${token}'},);
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  // Future<dynamic> authorizedGet(String url, Map<String, dynamic>? param) async {
  //   dynamic responseJson;
  //   try {
  //     print('$baseUrl/$url');
  //     print(param);
  //     String queryString = '';
  //     if (param != null && param.isNotEmpty) {
  //       queryString = Uri(queryParameters: param).query;
  //     }
  //     final Uri uri = Uri.parse('$baseUrl/$url?$queryString');
  //     final http.Response response = await http.get(uri, headers: <String, String>{HttpHeaders.authorizationHeader: 'Bearer ${token}'});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  // Future<dynamic> authorizedPost(String url, Object body) async {
  //   dynamic responseJson;
  //   try {
  //     print('$baseUrl/$url');
  //     print(body);
  //     final Uri uri = Uri.parse('$baseUrl/$url');
  //     final http.Response response = await http.post(uri, body: body, headers: <String, String>{HttpHeaders.authorizationHeader: 'Bearer ${token}'});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  // Future<dynamic> authorizedPatch(String url, Object body) async {
  //   String responseJson;
  //   try {
  //     print('$baseUrl/$url');
  //     print(body);
  //     final Uri uri = Uri.parse('$baseUrl/$url');
  //     final http.Response response = await http.patch(uri, body: body, headers: <String, String>{HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  // Future<dynamic> authorizedDelete(String url, Object body) async {
  //   dynamic responseJson;
  //   try {
  //     print('$baseUrl/$url');
  //     print(body);
  //     final Uri uri = Uri.parse('$baseUrl/$url');
  //     final http.Response response = await http.delete(uri, body: body, headers: <String, String>{HttpHeaders.authorizationHeader: token});
  //     responseJson = _response(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  dynamic _response(http.Response response) {
    print(response.body.toString());
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        dynamic responseJson = json.decode(response.body.toString());
        print(responseJson.toString());
        return responseJson;
      case 400:
        if (response.request!.url == ApiService.register) {
          var errorMessage = ErrorMessage(
              message: json.decode(response.body.toString())['message'], errors: json.decode(response.body.toString())['errors']);
          throw RegisterFailedException(errorMessage);
        } else {
          throw BadRequestException(response.body.toString());
        }
      case 401:
      case 403:
      case 409:
        throw UnauthorizedException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

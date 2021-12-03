import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:clean_architecture_tdd/core/error/exception.dart';
import 'package:clean_architecture_tdd/core/helper/app_enum.dart';
import 'package:http/http.dart';
import '../helper/app_secure_storage.dart';

class NetworkService {
  late Client _client;

  final Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Response> performRequest(
    String url,
    HttpAction action, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool noToken = false,
  }) async {
    try {
      _client = Client();
      late var response;

      //Get the jwtToken from secure storage and if existing, add to the header
      String? bearerToken = await SecureStorage.readValue("jwtToken");
      log(bearerToken ?? "No token found");
      if (bearerToken != null && !noToken) {
        _headers.addAll({'Authorization': 'Bearer $bearerToken'});
      }

      // Add new headers if there is to add
      if (headers != null && headers.isNotEmpty) {
        _headers.addAll(headers);
      }

      switch (action) {
        case HttpAction.GET:
          response = await _client.get(Uri.parse(url), headers: _headers);
          break;
        case HttpAction.POST:
          response = await _client
              .post(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;
        case HttpAction.POST_ENCODED_URL:
          response = await _client
              .post(
                Uri.parse(url),
                headers: {'Content-Type': "application/x-www-form-urlencoded"},
                body: body,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;
        case HttpAction.PUT:
          response = await _client
              .put(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;
        case HttpAction.PATCH:
          response = await _client
              .patch(
                Uri.parse(url),
                body: body != null ? json.encoder.convert(body) : "",
                headers: _headers,
              )
              .timeout(
                const Duration(seconds: 8),
              );
          break;
        case HttpAction.DELETE:
          response = await _client.delete(Uri.parse(url), headers: _headers).timeout(const Duration(seconds: 8));
          break;
      }

      log("Result: ${response.body}");

      return response;
    } on SocketException {
      throw NetworkException();
    } on TimeoutException{
      throw NetworkException();
    } on FormatException{
      throw NetworkException();
    } on HttpException {
      throw NetworkException();
    } finally {
      _client.close();
    }
  }
}

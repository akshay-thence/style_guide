// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart';

class HttpClient {
  dynamic get(String url) async {
    try {
      return _mapResponse(await Client().get(_parseUrl(url)));
    } catch (e) {
      rethrow;
    }
  }

  dynamic _mapResponse(Response res) {
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {}
  }

  Uri _parseUrl(String url) {
    return Uri.parse(url);
  }
}

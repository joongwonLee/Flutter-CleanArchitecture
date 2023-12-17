import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/model/photo.dart';

class PixabayApi {

  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '40944834-a8b088f37e0776293e80ed326';

  Future<Iterable> fetch(String query) async {
    final response = await client.get(Uri.parse(''
        '$baseUrl?key=$key&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits;
  }
}
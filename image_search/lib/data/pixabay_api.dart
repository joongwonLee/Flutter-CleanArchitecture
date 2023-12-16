import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/data/photo_api_repository.dart';
import '../model/Photo.dart';

class PixabayApi implements PhotoApiRepository {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '40944834-a8b088f37e0776293e80ed326';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(''
        '$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((value) => Photo.fromJson(value)).toList();
  }
}
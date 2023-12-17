import 'package:image_search/data/data_source/result.dart';

import '../model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}
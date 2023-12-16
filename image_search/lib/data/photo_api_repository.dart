import '../model/photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
import 'dart:math';

import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

import '../model/photo.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  /// callback 함수 활용 => 함수명을 call로 선언하면, 함수 호출 시 함수명 생략 가능
  /// GetPhotosUseCase().call() X, GetPhotosUseCase() O
  Future<Result<List<Photo>>> call(String query) async {
    final result = await repository.fetch(query);

    return result.when(
      success: (photos) {
        return Result.success(photos.sublist(0,min(3, photos.length)));
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}

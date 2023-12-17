import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import '../../domain/model/photo.dart';
import '../../domain/repository/photo_api_repository.dart';
import '../data_source/result.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  /// 주의: 예제에서 PixabayApi를 받을 때 내부 선언 형식으로 받는 것이 아닌, 외부에서 주입받는 형식으로 선언
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  Future<Result<List<Photo>>> fetch(String query, {http.Client? client}) async {
    final Result<Iterable> result = await api.fetch(query);

    /// freezed가 제공하는 함수 when (내부 return을 return 해줌)
    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}

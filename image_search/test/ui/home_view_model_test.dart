import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/presentation/home/home_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다', () async {

    /**
     * 테스트 시, 만약 PixabayApi에 문제가 생긴다면?
     * ViewModel 로직을 잘 짰어도 test 시 문제가 발생할 수 있음
     * HomeViewModel이 PixabayApi에 의존하고 있기 때문
     *
     * Api에 대한 인터페이스(photo_api_repository)를 정의하고, 테스트 코드 작성 시에는 임의의 데이터를 적용
     */
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
        viewModel.photos, result
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {

  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(Duration(milliseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }

}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 3063284,
    "pageURL": "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower wallpaper, flower",
    "previewURL": "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL": "https://pixabay.com/get/gecb0b29df53606aa6b8f79ffd17f4ff72bf94656358d8f11f0458d46fae50e2c5db3b21eda8d2aef0c67641929c59f5c466f4ba7d359032fd0c36e6adbfc7f02_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL": "https://pixabay.com/get/geaf49829b951d5daf0ecd7ce949a5599a95830cf76ef8dcef60ef0af4f3582bfaae9f778f912ed6ac8468e036ee5118caad39a8158266267eac247f530f4127c_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 1167092,
    "downloads": 761574,
    "collections": 1578,
    "likes": 1701,
    "comments": 345,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL": "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  },
  {
    "id": 887443,
    "pageURL": "https://pixabay.com/photos/flower-life-yellow-flower-crack-887443/",
    "type": "photo",
    "tags": "flower, life, yellow flower",
    "previewURL": "https://cdn.pixabay.com/photo/2015/08/13/20/06/flower-887443_150.jpg",
    "previewWidth": 150,
    "previewHeight": 116,
    "webformatURL": "https://pixabay.com/get/g57a2808ace107582fe699ee9cd37abe700b943d6b2fc6f001f137e6c2f410b7c84828ea5c2da7107bddce216d9110ae2_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 497,
    "largeImageURL": "https://pixabay.com/get/gb254b8f66149976890081656a30dc7fccc3e33f17d683748715ce1f089357ead3e5965e64858d81089b402c3892b24307027be51555b85746afc8e44d0e18293_1280.jpg",
    "imageWidth": 3867,
    "imageHeight": 3005,
    "imageSize": 2611531,
    "views": 443624,
    "downloads": 272942,
    "collections": 1028,
    "likes": 1351,
    "comments": 236,
    "user_id": 1298145,
    "user": "klimkin",
    "userImageURL": "https://cdn.pixabay.com/user/2017/07/18/13-46-18-393_250x250.jpg"
  },
];
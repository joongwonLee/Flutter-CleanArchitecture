import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/photo_api_repository.dart';
import '../model/photo.dart';

/// ChangeNotifier: Provider를 사용할 때 view model 내 상태관리를 모니터링하기 위한 class
class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  // get을 쓰는 이유: 내부에선 데이터의 변경을 가능하게 하고, 외부에서 데이터 수정을 막으려고
  // 자바에서 private 선언하고 get, set 함수 선언이랑 같은 용도인듯
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
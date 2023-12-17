import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

import '../../data/data_source/result.dart';
import '../../domain/model/photo.dart';
import '../../domain/repository/photo_api_repository.dart';

/// ChangeNotifier: Provider를 사용할 때 view model 내 상태관리를 모니터링하기 위한 class
class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  // get을 쓰는 이유: 내부에선 데이터의 변경을 가능하게 하고, 외부에서 데이터 수정을 막으려고
  // 자바에서 private 선언하고 get, set 함수 선언이랑 같은 용도인듯
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        _photos = photos;
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );

  }
}

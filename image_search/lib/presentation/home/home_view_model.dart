import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

import '../../data/data_source/result.dart';
import '../../domain/model/photo.dart';
import '../../domain/repository/photo_api_repository.dart';
import 'home_state.dart';

/// ChangeNotifier: Provider를 사용할 때 view model 내 상태관리를 모니터링하기 위한 class
class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  // get을 쓰는 이유: 내부에선 데이터의 변경을 가능하게 하고, 외부에서 데이터 수정을 막으려고
  // 자바에서 private 선언하고 get, set 함수 선언이랑 같은 용도인듯

  // List<Photo> _photos = [];
  // UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  // viewModel에서 사용하는 상태들을 HomeState 클래스를 만들어 관리
  HomeState _state = HomeState([], false);
  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners(); // 상태가 변할 때 해줘야 함

    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}

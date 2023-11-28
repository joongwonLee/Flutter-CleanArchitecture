
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/model/Photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;
  List<Photo> _photos = [];

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({required this.api, required super.child, super.key});

  // 다른 위젯에 자유롭게 얹을 수 있는?? 구글링
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context'); // assert가 null이면, 에러 발생
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }

}
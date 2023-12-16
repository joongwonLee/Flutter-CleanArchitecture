
import 'package:flutter/cupertino.dart';

import '../ui/home_view_model.dart';


class PhotoProvider extends InheritedWidget {

  final HomeViewModel viewModel;

  const PhotoProvider({required this.viewModel, required super.child, super.key});

  // 다른 위젯에 자유롭게 얹을 수 있는?? 구글링
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context'); // assert가 null이면, 에러 발생
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }

}
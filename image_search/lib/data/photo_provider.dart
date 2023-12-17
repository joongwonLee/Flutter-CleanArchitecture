
import 'package:flutter/cupertino.dart';

import '../presentation/home/home_view_model.dart';


/// 상태관리를 위한 라이브러리: Bloc, Provider, GetX 등,,
/// 아무 라이브러리를 사용하지 않는다면? InheritedWidget
///
/// * Provider를 사용하는 이유: view model 내의 상태를 모니터링하기 쉽게 만들기 위해

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
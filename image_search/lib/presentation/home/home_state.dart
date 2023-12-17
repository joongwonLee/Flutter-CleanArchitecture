import '../../domain/model/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

/// 외부에서 수정할 수 없는 HomeViewModel의 상태를 관리한다!!
/// freezed로 쉽게 만들 수 있음

@freezed
class HomeState with _$HomeState {
  factory HomeState(
    List<Photo> photos,
    bool isLoading,
  ) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}

// class HomeState {
//   final List<Photo> photos;
//   final bool isLoading;
//
//   HomeState(this.photos, this.isLoading);
//
//   HomeState copy({List<Photo>? photos, bool? isLoading}) {
//     return HomeState(
//       photos ??= this.photos,
//       isLoading ??= this.isLoading,
//     );
//   }
// }


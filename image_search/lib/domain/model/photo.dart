
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'photo.g.dart';


/// Code generator: 코드 실행 시 적용되는 것이 아니라 빌드 시 적용 ??
/// 사용하려면 build_runner와 함께 사용
///
/// JsonSerializable, Equatable, Freezed, Mockito 등..
///
/// *참고: Code generator로 만들어진 파일들 (ex. photo.g.dart, photo.freezed.dart, pixabay_api_test.mocks.dart)은 .gitignore에 두는 것 권장

// @JsonSerializable()
// // 변수보단 상수, 바뀔 수 있는 객체보단 불변 객체 사용
// // 그럼 불변 객체를 사용했을 때, 데이터를 바꾸는 작업은 ? => Freezed 라이브러리 사용
// class Photo extends Equatable {
//
//   final int id;
//   final String tags;
//
//   @JsonKey(name: 'previewURL') // Json의 이름과 매핑해서 변수명을 다르게 사용 가능
//   final String previewUrl;
//
//   const Photo({
//     required this.id,
//     required this.tags,
//     required this.previewUrl
//   });
//
//   factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PhotoToJson(this);
//
//   @override
//   List<Object?> get props => [id];
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.g.dart';
part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {

  factory Photo({
    required int id,
    required String tags,
    @JsonKey(name: 'previewURL') required String previewUrl,
}) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

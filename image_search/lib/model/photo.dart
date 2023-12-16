
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {

  final int id;
  final String tags;

  @JsonKey(name: 'previewURL') // Json의 이름과 매핑해서 변수명을 다르게 사용 가능
  final String previewUrl;

  const Photo({
    required this.id,
    required this.tags,
    required this.previewUrl
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [id];
}
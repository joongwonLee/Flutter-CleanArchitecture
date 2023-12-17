// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isLoading'] as bool,
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'photos': instance.photos,
      'isLoading': instance.isLoading,
    };

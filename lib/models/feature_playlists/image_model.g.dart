// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      height: (json['height'] as num?)?.toDouble(),
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'width': instance.width,
    };

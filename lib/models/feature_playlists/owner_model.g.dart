// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      displayName: json['display_name'] as String?,
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(json['external_urls']),
      href: json['href'] as String?,
      id: json['id'] as String?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'display_name': instance.displayName,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'type': instance.type,
      'uri': instance.uri,
    };

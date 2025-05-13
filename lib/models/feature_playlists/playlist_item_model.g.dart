// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistItems _$PlaylistItemsFromJson(Map<String, dynamic> json) =>
    PlaylistItems(
      collaborative: json['collaborative'] as bool?,
      description: json['description'] as String?,
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(json['external_urls']),
      href: json['href'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)?.map(Images.fromJson).toList(),
      name: json['name'] as String?,
      owner: json['owner'] == null ? null : Owner.fromJson(json['owner']),
      primaryColor: json['primary_color'] as String?,
      public: json['public'] as bool?,
      snapshotId: json['snapshot_id'] as String?,
      tracks: json['tracks'] == null ? null : Tracks.fromJson(json['tracks']),
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$PlaylistItemsToJson(PlaylistItems instance) =>
    <String, dynamic>{
      'collaborative': instance.collaborative,
      'description': instance.description,
      'external_urls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'owner': instance.owner,
      'primary_color': instance.primaryColor,
      'public': instance.public,
      'snapshot_id': instance.snapshotId,
      'tracks': instance.tracks,
      'type': instance.type,
      'uri': instance.uri,
    };

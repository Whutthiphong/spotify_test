// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedPlaylistModel _$FeaturedPlaylistModelFromJson(
        Map<String, dynamic> json) =>
    FeaturedPlaylistModel(
      message: json['message'] as String?,
      playlists: json['playlists'] == null
          ? null
          : PlaylistModel.fromJson(json['playlists']),
    );

Map<String, dynamic> _$FeaturedPlaylistModelToJson(
        FeaturedPlaylistModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'playlists': instance.playlists,
    };

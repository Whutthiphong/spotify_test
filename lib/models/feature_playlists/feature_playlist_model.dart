import 'package:json_annotation/json_annotation.dart';
import 'package:spotify_test/models/feature_playlists/playlist_model.dart';

part 'feature_playlist_model.g.dart';

@JsonSerializable()
class FeaturedPlaylistModel {
  String? message;
  PlaylistModel? playlists;

  FeaturedPlaylistModel({this.message, this.playlists});

  factory FeaturedPlaylistModel.fromJson(json) =>
      _$FeaturedPlaylistModelFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedPlaylistModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:spotify_test/models/feature_playlists/external_url_model.dart';
import 'package:spotify_test/models/feature_playlists/image_model.dart';
import 'package:spotify_test/models/feature_playlists/owner_model.dart';
import 'package:spotify_test/models/feature_playlists/track_model.dart';

part 'playlist_item_model.g.dart';

@JsonSerializable()
class PlaylistItems {
  bool? collaborative;
  String? description;
  @JsonKey(name: 'external_urls')
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  Owner? owner;
  @JsonKey(name: 'primary_color')
  String? primaryColor;
  bool? public;
  @JsonKey(name: 'snapshot_id')
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  PlaylistItems(
      {this.collaborative,
      this.description,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.owner,
      this.primaryColor,
      this.public,
      this.snapshotId,
      this.tracks,
      this.type,
      this.uri});

  factory PlaylistItems.fromJson(json) => _$PlaylistItemsFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistItemsToJson(this);
}

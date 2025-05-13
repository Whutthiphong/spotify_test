import 'package:json_annotation/json_annotation.dart';
import 'package:spotify_test/models/feature_playlists/playlist_item_model.dart';

part 'playlist_model.g.dart';

@JsonSerializable()
class PlaylistModel {
  String? href;
  List<PlaylistItems>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  PlaylistModel(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  factory PlaylistModel.fromJson(json) => _$PlaylistModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistModelToJson(this);

  PlaylistModel copyWith({
    String? href,
    List<PlaylistItems>? items,
    int? limit,
    String? next,
    int? offset,
    String? previous,
    int? total,
  }) {
    return PlaylistModel(
      href: href ?? this.href,
      items: items ?? this.items,
      limit: limit ?? this.limit,
      next: next ?? this.next,
      offset: offset ?? this.offset,
      previous: previous ?? this.previous,
      total: total ?? this.total,
    );
  }
}

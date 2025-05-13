import 'package:json_annotation/json_annotation.dart';
import 'package:spotify_test/models/feature_playlists/external_url_model.dart';

part 'owner_model.g.dart';

@JsonSerializable()
class Owner {
  @JsonKey(name: 'display_name')
  String? displayName;
  @JsonKey(name: 'external_urls')
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory Owner.fromJson(json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}

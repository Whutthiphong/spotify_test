import 'package:json_annotation/json_annotation.dart';

part 'external_url_model.g.dart';

@JsonSerializable()
class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(json) => _$ExternalUrlsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
}

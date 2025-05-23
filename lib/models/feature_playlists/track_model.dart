import 'package:json_annotation/json_annotation.dart';

part 'track_model.g.dart';

@JsonSerializable()
class Tracks {
  String? href;
  int? total;

  Tracks({this.href, this.total});

  factory Tracks.fromJson(json) => _$TracksFromJson(json);
  Map<String, dynamic> toJson() => _$TracksToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class Images {
  double? height;
  String? url;
  double? width;

  Images({this.height, this.url, this.width});
  factory Images.fromJson(json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

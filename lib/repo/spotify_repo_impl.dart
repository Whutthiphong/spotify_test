import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_test/constant/constants.dart';
import 'package:spotify_test/data/network/api.dart';
import 'package:spotify_test/models/feature_playlists/feature_playlist_model.dart';
import 'package:spotify_test/models/feature_playlists/playlist_model.dart';
import 'package:spotify_test/models/login_token_model.dart';
import 'package:spotify_test/repo/spotify_repo.dart';

@injectable
class SpotifyRepoImpl extends SpotifyRepo {
  final ApiProvider apiProvider;

  SpotifyRepoImpl({required this.apiProvider});

  @override
  Future<FeaturedPlaylistModel?> getFeaturePlaylist(int skip) async {
    try {
      Response resp = await apiProvider
          .get('v1/browse/featured-playlists?offset=$skip&limit=20');
      if (resp.data != null && resp.statusCode == 200) {
        return FeaturedPlaylistModel.fromJson(resp.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<LoginTokenModel?> loginToken() async {
    try {
      Dio dio = Dio();
      Response resp = await dio.post('https://accounts.spotify.com/api/token',
          data: {
            'grant_type': 'client_credentials',
            'client_id': 'f2cfe75a229d46ba861ddd7f615957c9',
            'client_secret': 'd42028fec6c34aa1b9c9ae21c6134978',
          },
          options: Options(
              headers: {'Content-Type': 'application/x-www-form-urlencoded'}));
      if (resp.data != null && resp.statusCode == 200) {
        return LoginTokenModel.fromJson(resp.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

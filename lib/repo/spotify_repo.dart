import 'package:spotify_test/models/feature_playlists/feature_playlist_model.dart';
import 'package:spotify_test/models/feature_playlists/playlist_model.dart';
import 'package:spotify_test/models/login_token_model.dart';

abstract class SpotifyRepo {
  Future<FeaturedPlaylistModel?> getFeaturePlaylist(int skip);
  Future<LoginTokenModel?> loginToken();
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_test/models/feature_playlists/feature_playlist_model.dart';
import 'package:spotify_test/models/feature_playlists/playlist_model.dart';
import 'package:spotify_test/repo/spotify_repo_impl.dart';

part 'spotify_event.dart';
part 'spotify_state.dart';

@injectable
class SpotifyBloc extends Bloc<SpotifyEvent, SpotifyState> {
  final SpotifyRepoImpl spotifyRepoImpl;
  SpotifyBloc(this.spotifyRepoImpl) : super(SpotifyState()) {
    on<LoadFeatureListEvent>(loadFeatureList);
  }

  Future<FutureOr<void>> loadFeatureList(
      LoadFeatureListEvent event, Emitter<SpotifyState> emit) async {
    emit(state.copyWith(
        newFeatureList: state.featureList, newStateType: StateType.loading));
    FeaturedPlaylistModel? data = await spotifyRepoImpl
        .getFeaturePlaylist(state.featureList?.items?.length ?? 0);
    if (data?.playlists?.items != null && state.featureList != null) {
      state.featureList!.items?.addAll(data!.playlists!.items!.toList());
    }
    var newFeatureList = state.featureList?.copyWith(
      href: state.featureList?.href,
      items: state.featureList?.items,
      limit: state.featureList?.limit,
      next: state.featureList?.next,
      offset: state.featureList?.offset,
      previous: state.featureList?.previous,
      total: state.featureList?.total,
    );
    emit(state.copyWith(
        newFeatureList: newFeatureList ?? data?.playlists,
        newStateType: StateType.loaded));
  }
}

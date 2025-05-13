part of 'spotify_bloc.dart';

enum StateType {
  init,
  loading,
  loaded,
}

class SpotifyState extends Equatable {
  final StateType stateType;
  final PlaylistModel? featureList;

  SpotifyState({this.featureList, this.stateType = StateType.init});

  @override
  List<Object?> get props => [featureList];

  SpotifyState copyWith(
      {PlaylistModel? newFeatureList, StateType? newStateType}) {
    return SpotifyState(
        featureList: newFeatureList ?? featureList,
        stateType: newStateType ?? stateType);
  }
}

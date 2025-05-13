// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/spotify_bloc.dart' as _i5;
import '../data/network/api.dart' as _i3;
import '../repo/spotify_repo_impl.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ApiProvider>(() => _i3.ApiProvider());
  gh.factory<_i4.SpotifyRepoImpl>(
      () => _i4.SpotifyRepoImpl(apiProvider: gh<_i3.ApiProvider>()));
  gh.factory<_i5.SpotifyBloc>(() => _i5.SpotifyBloc(gh<_i4.SpotifyRepoImpl>()));
  return getIt;
}

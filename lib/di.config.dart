// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/sources/data/data_sources/remote/source_remote_ds.dart'
    as _i457;
import 'features/sources/data/data_sources/remote/source_remote_ds_impl.dart'
    as _i730;
import 'features/sources/data/repositories/source_repo_impl.dart' as _i797;
import 'features/sources/domain/repositories/source_repo.dart' as _i345;
import 'features/sources/domain/use_cases/sources_use_case.dart' as _i395;
import 'features/sources/presentation/bloc/source_screen_bloc.dart' as _i897;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i457.SourceRemoteDs>(
        () => _i730.SourceRemoteDsImpl(gh<_i237.ApiManager>()));
    gh.factory<_i345.SourceRepo>(
        () => _i797.SourceRepoImpl(gh<_i457.SourceRemoteDs>()));
    gh.factory<_i395.SourcesUseCase>(
        () => _i395.SourcesUseCase(gh<_i345.SourceRepo>()));
    gh.factory<_i897.SourceScreenBloc>(
        () => _i897.SourceScreenBloc(gh<_i395.SourcesUseCase>()));
    return this;
  }
}

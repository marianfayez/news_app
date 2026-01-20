import 'package:injectable/injectable.dart';
import 'package:news_app/core/utilities/cache_helper.dart';
import 'package:news_app/features/sources/data/data_sources/local/source_local_ds.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';

@Injectable(as: SourceLocalDs)
class SourceLocalDsImpl implements SourceLocalDs {

  static const _key = 'sourceModel';

  @override
  Future<SourcesModel?> getSources({String? catId}) async {
    final box =
    await HiveCoreService.openBox<SourcesModel>('SourceBox$catId');

    return box.get(_key);
  }

  @override
  Future<void> saveSources(SourcesModel model, String catId) async {
    final box =
    await HiveCoreService.openBox<SourcesModel>('SourceBox$catId');

    await box.put(_key, model);
  }
}

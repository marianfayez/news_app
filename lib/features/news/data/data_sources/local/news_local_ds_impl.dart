import 'package:injectable/injectable.dart';
import 'package:news_app/core/utilities/cache_helper.dart';
import 'package:news_app/features/news/data/data_sources/local/news_local_ds.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

@Injectable(as: NewsLocalDs)
class NewsLocalDsImpl implements NewsLocalDs {

  static const _key = 'newsModel';

  @override
  Future<NewsModel?> getNews({String? sourceId}) async {
    final box =
    await HiveCoreService.openBox<NewsModel>('NewsBox$sourceId');

    return box.get(_key);
  }

  @override
  Future<void> saveNews(NewsModel model, String sourceId) async {
    final box =
    await HiveCoreService.openBox<NewsModel>('NewsBox$sourceId');

    await box.put(_key, model);
  }
}

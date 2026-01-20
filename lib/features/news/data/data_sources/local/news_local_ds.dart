import 'package:news_app/features/news/data/models/news_model.dart';

abstract class NewsLocalDs {
  Future<NewsModel?> getNews({String? sourceId});
  Future<void> saveNews(NewsModel model, String sourceId);
}

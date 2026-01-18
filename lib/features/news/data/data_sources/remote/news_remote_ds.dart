import 'package:news_app/features/news/data/models/news_model.dart';

abstract class NewsRemoteDs{

  Future<NewsModel>getNews({String? sourceId});

}
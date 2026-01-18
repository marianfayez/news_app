import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/resources/endpoints.dart';
import 'package:news_app/features/news/data/data_sources/remote/news_remote_ds.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';

@Injectable(as: NewsRemoteDs)
class NewsRemoteDsImpl implements NewsRemoteDs{

  ApiManager apiManager;
  NewsRemoteDsImpl(this.apiManager);

  @override
  Future<NewsModel> getNews({String? sourceId}) async{

    try {
      final response = await apiManager.getData(endPoint: EndPoints.getNews,
          queryParameters:  {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","sources":sourceId});

      return NewsModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = e.error?.toString() ?? 'Unknown error occurred';
      throw Exception(errorMessage); // or rethrow with ServerFailure if using Either
    }

  }


}
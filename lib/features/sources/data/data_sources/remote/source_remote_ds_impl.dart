import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/resources/endpoints.dart';
import 'package:news_app/features/sources/data/data_sources/remote/source_remote_ds.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';

@Injectable(as: SourceRemoteDs)
class SourceRemoteDsImpl implements SourceRemoteDs{

  ApiManager apiManager;
  SourceRemoteDsImpl(this.apiManager);

  @override
  Future<SourcesModel> getSources({String? catId}) async{

    try {
      final response = await apiManager.getData(endPoint: EndPoints.getSources,
          queryParameters:  {"apiKey": "3512e29a752f4dd6bc7339fa9094bc3c","category":catId});

      return SourcesModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = e.error?.toString() ?? 'Unknown error occurred';
      throw Exception(errorMessage); // or rethrow with ServerFailure if using Either
    }

  }


}
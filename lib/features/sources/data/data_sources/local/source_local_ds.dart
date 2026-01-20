

import 'package:news_app/features/sources/data/model/sources_model.dart';

abstract class SourceLocalDs{

  Future<SourcesModel?> getSources({String? catId});
  Future<void> saveSources(SourcesModel model, String catId);
}
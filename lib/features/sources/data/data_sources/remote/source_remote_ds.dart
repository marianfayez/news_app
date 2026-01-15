

import 'package:news_app/features/sources/data/model/sources_model.dart';

abstract class SourceRemoteDs{

  Future<SourcesModel>getSources({String? catId});

}
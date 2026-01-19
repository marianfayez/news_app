import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/features/sources/data/model/sources_model.dart';

abstract class SourceRepo{

  Future<Either<RouteFailures,SourcesModel>>getSources({String? catId,required bool useRemote});

}
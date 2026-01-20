import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failuers/failuers.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

abstract class NewsRepo{

  Future<Either<RouteFailures,NewsModel>>getNews({String? sourceId,required bool useRemote});

}
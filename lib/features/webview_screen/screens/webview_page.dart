import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di.dart';
import 'package:news_app/features/webview_screen/bloc/webview_screen_bloc.dart';
import 'package:news_app/features/webview_screen/widget/article_webView_screen.dart';

@RoutePage()
class ArticleWebViewPage extends StatelessWidget {
  final String url;
  final String title;

  const ArticleWebViewPage({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ArticleWebViewBloc>(),
      child: ArticleWebViewScreen(
        url: url,
        title: title,
      ),
    );
  }
}

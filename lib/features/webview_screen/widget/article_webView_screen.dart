import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/webview_screen/bloc/webview_screen_bloc.dart';
import 'package:news_app/features/webview_screen/bloc/webview_screen_event.dart';
import 'package:news_app/features/webview_screen/bloc/webview_screen_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const ArticleWebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<ArticleWebViewScreen> createState() => _ArticleWebViewScreenState();
}

class _ArticleWebViewScreenState extends State<ArticleWebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            context.read<ArticleWebViewBloc>().add(PageStartedEvent());
          },
          onPageFinished: (_) {
            context.read<ArticleWebViewBloc>().add(PageFinishedEvent());
          },
          onWebResourceError: (_) {
            context
                .read<ArticleWebViewBloc>()
                .add(PageErrorEvent('Failed to load article'));
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: BlocBuilder<ArticleWebViewBloc, ArticleWebViewState>(
        builder: (context, state) {
          return Stack(
            children: [
              WebViewWidget(controller: controller),
              if (state.status == ArticleWebViewStatus.loading)
                const Center(child: CircularProgressIndicator()),
              if (state.status == ArticleWebViewStatus.error)
                Center(
                  child: Text(
                    state.errorMessage ?? 'Something went wrong',
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

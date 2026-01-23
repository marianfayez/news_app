import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_event.dart';
import 'package:news_app/features/news/presentation/bloc/news_state.dart';
import 'package:news_app/features/news/presentation/widgets/news_item.dart';
import 'package:news_app/features/sources/presentation/bloc/source_screen_bloc.dart';
import 'package:news_app/features/sources/presentation/bloc/source_screen_event.dart';

class SourcesContent extends StatefulWidget {
  final Function onTap;

  const SourcesContent({super.key, required this.onTap});

  @override
  State<SourcesContent> createState() => _SourcesContentState();
}

class _SourcesContentState extends State<SourcesContent> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SourceScreenBloc, SourceScreenState>(
      listener: (context, state) {
        if (state.getSourcesState == SourceRequestState.error) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Error"),
                    content: Text(state.sourceFailures?.message ??
                        "Something went wrong"),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                            widget.onTap();
                          },
                          child: const Text("ok"))
                    ],
                  ));
        }

        if (state.getSourcesState == SourceRequestState.success) {
          final sources = state.sourcesModel?.sources ?? [];
          if (sources.isNotEmpty) {
            context.read<NewsScreenBloc>().add(
                  GetNewsEvent(sourceId: sources[state.selectedIndex].id!),
                );
          }
        }
      },
      builder: (context, state) {
        if (state.getSourcesState == SourceRequestState.loading ||
            state.getSourcesState == SourceRequestState.initial) {
          return const Center(child: CircularProgressIndicator());
        }

        final sources = state.sourcesModel?.sources ?? [];
        if (sources.isEmpty) {
          return Center(
              child: Text(
            'No sources found',
            style: Theme.of(context).textTheme.titleMedium,
          ));
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: TextField(
                cursorColor: Theme.of(context).secondaryHeaderColor,
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  focusColor: Theme.of(context).secondaryHeaderColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  hintText: 'Search news...',
                  hintStyle:
                      TextStyle(color: Theme.of(context).secondaryHeaderColor),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) {
                    _debounce!.cancel();
                  }

                  final sources = context
                      .read<SourceScreenBloc>()
                      .state
                      .sourcesModel
                      ?.sources;
                  if (sources == null || sources.isEmpty) return;
                  final sourceId = sources[
                          context.read<SourceScreenBloc>().state.selectedIndex]
                      .id!;
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    context.read<NewsScreenBloc>().add(
                          SearchNewsEvent(
                            query: value,
                            sourceId: sourceId,
                          ),
                        );
                  });
                },
              ),
            ),
            DefaultTabController(
              initialIndex: state.selectedIndex,
              length: sources.length,
              child: TabBar(
                onTap: (index) {
                  context
                      .read<SourceScreenBloc>()
                      .add(ChangeSourceIndexEvent(index));
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                unselectedLabelColor:
                    Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                labelPadding: EdgeInsets.symmetric(horizontal: 12.w),
                indicatorColor: Theme.of(context).secondaryHeaderColor,
                labelColor: Theme.of(context).secondaryHeaderColor,
                tabs: sources.map((e) => Tab(text: e.name)).toList(),
              ),
            ),
            Expanded(
              child: BlocBuilder<NewsScreenBloc, NewsScreenState>(
                builder: (context, newsState) {
                  if (newsState.getNewsState == NewsRequestState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final articles = newsState.newsModel?.articles ?? [];
                  if (articles.isEmpty) {
                    return Center(
                        child: Text(
                      "No news found",
                      style: Theme.of(context).textTheme.titleSmall,
                    ));
                  }

                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) =>
                        NewsItem(articles: articles[index]),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

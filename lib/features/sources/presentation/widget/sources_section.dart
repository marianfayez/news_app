import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_event.dart';
import 'package:news_app/features/news/presentation/bloc/news_state.dart';
import 'package:news_app/features/news/presentation/widgets/news_item.dart';
import 'package:news_app/features/sources/presentation/bloc/source_screen_bloc.dart';
import 'package:news_app/features/sources/presentation/bloc/source_screen_event.dart';
import 'package:news_app/di.dart';

class SourcesSection extends StatelessWidget {
  final String categoryId;
  final Function onTap;
  final bool hasInternet = false;

  const SourcesSection(
      {required this.categoryId, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SourceScreenBloc>(
          create: (context) => getIt<SourceScreenBloc>()
            ..add(GetSourcesEvent(catId: categoryId)),
        ),
        BlocProvider<NewsScreenBloc>(
          create: (context) => getIt<NewsScreenBloc>(),
        ),
      ],
      child: BlocConsumer<SourceScreenBloc, SourceScreenState>(
        listener: (context, state) {
          if (state.getSourcesState == SourceRequestState.success) {
            final sources = state.sourcesModel?.sources ?? [];

            if (sources.isNotEmpty) {
              context.read<NewsScreenBloc>().add(
                    GetNewsEvent(sourceId: sources[state.selectedIndex].id!),
                  );
            }
          }
          if (state.getSourcesState == SourceRequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: const Text(
                        "SomeThing went wrong",
                        style: TextStyle(color: Colors.black),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("ok"))
                      ],
                    ));
          }
        },
        builder: (context, state) {
          if (state.getSourcesState == SourceRequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var list = state.sourcesModel?.sources ?? [];
            if (list.isEmpty) {
              return Center(
                  child: Text(
                'No sources found',
                style: Theme.of(context).textTheme.titleMedium,
              ));
            }
            return Column(children: [
              DefaultTabController(
                initialIndex: state.selectedIndex,
                length: list.length,
                child: TabBar(
                    onTap: (value) {
                      context
                          .read<SourceScreenBloc>()
                          .add(ChangeSourceIndexEvent(value));
                      context
                          .read<NewsScreenBloc>()
                          .add(GetNewsEvent(sourceId: list[value].id!));
                    },
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor:
                        Theme.of(context).secondaryHeaderColor,
                    labelPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    indicatorColor: Theme.of(context).secondaryHeaderColor,
                    labelColor: Theme.of(context).secondaryHeaderColor,
                    tabs: list
                        .map((element) => Tab(text: element.name))
                        .toList()),
              ),
              Expanded(
                child: BlocBuilder<NewsScreenBloc, NewsScreenState>(
                  builder: (context, state) {
                    if (state.getNewsState == NewsRequestState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    var articles = state.newsModel?.articles ?? [];

                    if (articles.isEmpty) {
                      return Center(
                          child: Text(
                        "No news found",
                        style: Theme.of(context).textTheme.titleSmall,
                      ));
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsItem(
                          articles: articles[index],
                        );
                      },
                      itemCount: articles.length,
                    );
                  },
                ),
              ),
            ]);
          }
        },
      ),
    );
  }
}

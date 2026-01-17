import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/color_manager.dart';
import 'package:news_app/core/resources/styles_manager.dart';
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
    return BlocProvider<SourceScreenBloc>(
      create: (context) =>
      getIt<SourceScreenBloc>()
        ..add(GetSourcesEvent(catId: categoryId)),
      child: BlocConsumer<SourceScreenBloc, SourceScreenState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state.getSourcesState == SourceRequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            var list = state.sourcesModel?.sources ?? [];
            if (list.isEmpty) {
              return const Center(child: Text('No sources found'));
            }
            return DefaultTabController(
                initialIndex: state.selectedIndex,
                length: list.length,
              child: Column(
                  children: [
                    
                         TabBar(
                            onTap: (value) {
                              context.read<SourceScreenBloc>().add(ChangeSourceIndexEvent(value));
                            },
                            isScrollable: true,
                            dividerColor: Colors.transparent,
                            indicatorColor: Theme
                                .of(context)
                                .secondaryHeaderColor,
                            labelColor: Theme
                                .of(context)
                                .secondaryHeaderColor,
                            tabs: list
                                .map((element) => Tab(text: element.name))
                                .toList()), Expanded(
                      child: TabBarView(
                        children: list.map((source) {
                          return Center(
                            child: Text(
                              source.name ?? '',style: Theme.of(context).textTheme.titleMedium,

                            ),
                          );
                        }).toList(),
                      ),),
                    // Expanded(
                    //     child: ListView.builder(
                    //       itemBuilder: (context, index) {
                    //         return NewsItem(
                    //           articles: HomeCubit.get(context).newsModel!.articles![index],
                    //         );
                    //       },
                    //       itemCount: HomeCubit.get(context).newsModel?.articles?.length??0,
                    //     ))
                        ]),
            );
            // return Column(
            //     children: [
            //       DefaultTabController(
            //           initialIndex:  state.selectedIndex,
            //           length: list.length,
            //           child: TabBar(
            //               onTap: (value) { context.read<SourceScreenBloc>()
            //                   .add(ChangeSourceIndexEvent(value));},
            //               isScrollable: true,
            //               dividerColor: Colors.transparent,
            //               indicatorColor: Theme
            //                   .of(context)
            //                   .primaryColor,
            //               labelColor: Theme
            //                   .of(context)
            //                   .primaryColor,
            //               tabs: list
            //                   .map((element) => Tab(text: element.name))
            //                   .toList()),
            //       ),
            //     ]);
          }
        },
      ),
    );
  }


}

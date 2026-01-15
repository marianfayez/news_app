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
          print('🔥 Builder fired: state = $state');
          if (state.getSourcesState == SourceRequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
            var list = state.sourcesModel?.sources ?? [];
            print('🔥 list length = ${list.length}');
            return Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return Text(list[index].name??"",style: getSmallStyle(color: ColorManager.white),);
              },itemCount: list.length,),
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
            //       ),Expanded(
            //           child:TabBarView(
            //             children: list.map((source) {
            //               return Center(
            //                 child: Text(
            //                   source.name ?? '',
            //                   style: Theme.of(context).textTheme.bodyLarge,
            //                 ),
            //               );
            //             }).toList(),
            //           ),
            //       )
            //     ]);
          }
        },
      ),
    );
  }


}

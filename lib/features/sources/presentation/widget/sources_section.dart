import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di.dart';
import 'package:news_app/features/internet_service/presentation/bloc/connectivity_bloc.dart';
import 'package:news_app/features/internet_service/presentation/bloc/connectivity_event.dart';
import 'package:news_app/features/internet_service/presentation/bloc/connectivity_state.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/sources/presentation/bloc/source_screen_bloc.dart';
import 'package:news_app/features/sources/presentation/bloc/source_screen_event.dart';
import 'package:news_app/features/sources/presentation/widget/sources_content.dart';

class SourcesSection extends StatelessWidget {
  final String categoryId;
  final Function onTap;

  const SourcesSection(
      {required this.categoryId, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (_) => getIt<ConnectivityBloc>()..add(CheckConnectionEvent()),
        ),
        BlocProvider<NewsScreenBloc>(
          create: (_) => getIt<NewsScreenBloc>(),
        ),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, connectivityState) {
          if (connectivityState.requestState ==
              ConnectivityRequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          bool isConnected = connectivityState.requestState ==
              ConnectivityRequestState.connected;

          return BlocProvider<SourceScreenBloc>(
            create: (_) => getIt<SourceScreenBloc>()
              ..add(GetSourcesEvent(
                catId: categoryId,
                useRemote: isConnected,
              )),
            child: SourcesContent(onTap: onTap),
          );
        },
      ),
    );
  }
}

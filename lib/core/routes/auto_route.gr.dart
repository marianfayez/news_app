// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:news_app/features/home_screen.dart' as _i2;
import 'package:news_app/features/splash_screen.dart' as _i3;
import 'package:news_app/features/webview_screen/screens/webview_page.dart'
    as _i1;

/// generated route for
/// [_i1.ArticleWebViewPage]
class ArticleWebViewRoute extends _i4.PageRouteInfo<ArticleWebViewRouteArgs> {
  ArticleWebViewRoute({
    _i5.Key? key,
    required String url,
    required String title,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ArticleWebViewRoute.name,
          args: ArticleWebViewRouteArgs(
            key: key,
            url: url,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleWebViewRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleWebViewRouteArgs>();
      return _i1.ArticleWebViewPage(
        key: args.key,
        url: args.url,
        title: args.title,
      );
    },
  );
}

class ArticleWebViewRouteArgs {
  const ArticleWebViewRouteArgs({
    this.key,
    required this.url,
    required this.title,
  });

  final _i5.Key? key;

  final String url;

  final String title;

  @override
  String toString() {
    return 'ArticleWebViewRouteArgs{key: $key, url: $url, title: $title}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i2.HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}

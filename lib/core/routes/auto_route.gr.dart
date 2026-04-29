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

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ArticleWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleWebViewRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ArticleWebViewPage(
          key: args.key,
          url: args.url,
          title: args.title,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
  };
}

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

  static const _i4.PageInfo<ArticleWebViewRouteArgs> page =
      _i4.PageInfo<ArticleWebViewRouteArgs>(name);
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

  static const _i4.PageInfo<HomeRouteArgs> page =
      _i4.PageInfo<HomeRouteArgs>(name);
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

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/branding.png
  AssetGenImage get branding =>
      const AssetGenImage('assets/images/branding.png');

  /// File path: assets/images/business_dark.png
  AssetGenImage get businessDark =>
      const AssetGenImage('assets/images/business_dark.png');

  /// File path: assets/images/business_light.png
  AssetGenImage get businessLight =>
      const AssetGenImage('assets/images/business_light.png');

  /// File path: assets/images/entertainment_dark.png
  AssetGenImage get entertainmentDark =>
      const AssetGenImage('assets/images/entertainment_dark.png');

  /// File path: assets/images/entertainment_light.png
  AssetGenImage get entertainmentLight =>
      const AssetGenImage('assets/images/entertainment_light.png');

  /// File path: assets/images/general_dark.png
  AssetGenImage get generalDark =>
      const AssetGenImage('assets/images/general_dark.png');

  /// File path: assets/images/general_light.png
  AssetGenImage get generalLight =>
      const AssetGenImage('assets/images/general_light.png');

  /// File path: assets/images/health_dark.png
  AssetGenImage get healthDark =>
      const AssetGenImage('assets/images/health_dark.png');

  /// File path: assets/images/health_light.png
  AssetGenImage get healthLight =>
      const AssetGenImage('assets/images/health_light.png');

  /// File path: assets/images/science_dark.png
  AssetGenImage get scienceDark =>
      const AssetGenImage('assets/images/science_dark.png');

  /// File path: assets/images/science_light.png
  AssetGenImage get scienceLight =>
      const AssetGenImage('assets/images/science_light.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// File path: assets/images/sports_dark.png
  AssetGenImage get sportsDark =>
      const AssetGenImage('assets/images/sports_dark.png');

  /// File path: assets/images/sports_light.png
  AssetGenImage get sportsLight =>
      const AssetGenImage('assets/images/sports_light.png');

  /// File path: assets/images/technology_dark.png
  AssetGenImage get technologyDark =>
      const AssetGenImage('assets/images/technology_dark.png');

  /// File path: assets/images/technology_light.png
  AssetGenImage get technologyLight =>
      const AssetGenImage('assets/images/technology_light.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        branding,
        businessDark,
        businessLight,
        entertainmentDark,
        entertainmentLight,
        generalDark,
        generalLight,
        healthDark,
        healthLight,
        scienceDark,
        scienceLight,
        splashLogo,
        sportsDark,
        sportsLight,
        technologyDark,
        technologyLight
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

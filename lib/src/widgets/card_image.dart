import 'package:flutter/material.dart';

import '../constants/constants.dart';

/// Builds an [ExactAssetImage] based on the provided background image path.
///
/// If [backgroundImage] is not null, it returns an [ExactAssetImage] with the provided path.
/// If [backgroundImage] is null, it returns a default [ExactAssetImage] with a world map from the constants.
ExactAssetImage buildExactAssetImage(String? backgroundImage) {
  if (backgroundImage != null) {
    return ExactAssetImage(
      backgroundImage,
    );
  } else {
    return const ExactAssetImage(
      Constants.worldMap,
      package: Constants.packageName,
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/constants.dart';

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

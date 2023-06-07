import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class CardNetwork {
  CardNetwork._();

  static SvgPicture get jcb {
    return SvgPicture.asset(
      Constants.jcb,
      package: Constants.packageName,
      height: 35,
      fit: BoxFit.contain,
    );
  }

  static SvgPicture get discover {
    return SvgPicture.asset(
      Constants.discover,
      package: Constants.packageName,
      height: 40,
      fit: BoxFit.fitWidth,
    );
  }

  static Image get americanExpress {
    return const Image(
      image: ExactAssetImage(
        Constants.americanExpress,
        package: Constants.packageName,
      ),
      height: 40,
      fit: BoxFit.fitWidth,
    );
  }

  static SvgPicture get verve {
    return SvgPicture.asset(
      Constants.verve,
      package: Constants.packageName,
      height: 40,
      fit: BoxFit.contain,
    );
  }

  static SvgPicture get mastercard {
    return SvgPicture.asset(
      Constants.mastercard,
      package: Constants.packageName,
      height: 40,
      fit: BoxFit.contain,
    );
  }

  static Image get visa {
    return const Image(
      image: ExactAssetImage(
        Constants.visa,
        package: Constants.packageName,
      ),
      height: 40,
      fit: BoxFit.fitWidth,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

/// A utility class providing static methods to retrieve card network icons.
class CardNetworkIcon {
  CardNetworkIcon._();

  /// Returns the JCB card network icon as an SvgPicture widget.
  static SvgPicture get jcb {
    return SvgPicture.asset(
      Constants.jcb,
      package: Constants.packageName,
      height: 35,
      fit: BoxFit.contain,
    );
  }

  /// Returns the Discover card network icon as an SvgPicture widget.
  static SvgPicture get discover {
    return SvgPicture.asset(
      Constants.discover,
      package: Constants.packageName,
      height: 40,
      fit: BoxFit.fitWidth,
    );
  }

  /// Returns the American Express card network icon as an Image widget.
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

  /// Returns the Verve card network icon as an SvgPicture widget.
  static SvgPicture get verve {
    return SvgPicture.asset(
      Constants.verve,
      package: Constants.packageName,
      height: 40,
      fit: BoxFit.contain,
    );
  }

  /// Returns the Mastercard card network icon as an SvgPicture widget.
  static SvgPicture get mastercard {
    return SvgPicture.asset(
      Constants.mastercard,
      package: Constants.packageName,
      height: 40,
      fit: BoxFit.contain,
    );
  }

  /// Returns the Visa card network icon as an Image widget.
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

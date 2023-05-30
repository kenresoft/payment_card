import 'package:flutter/material.dart';
import 'package:payment_card/payment_card.dart';
import 'package:payment_card/src/extensions.dart';

class CardText extends StatelessWidget {
  CardText(
    String this.data, {
    Key? key,
    this.textSpan,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    required this.cardVariants,
  })  : style = cardVariants?.buildTextStyle(),
        super(key: key);

  /// The text to display.
  final String? data;

  /// The text to display as a [InlineSpan].
  final InlineSpan? textSpan;

  /// If non-null, the style to use for this text.
  final TextStyle? style;
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final CardNumberStyles? cardVariants;

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: style,
      textAlign: textAlign,
      textWidthBasis: textWidthBasis,
      maxLines: maxLines,
      textScaleFactor: textScaleFactor,
      softWrap: softWrap,
      overflow: overflow,
      selectionColor: selectionColor,
      key: key,
      locale: locale,
      semanticsLabel: data,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
    );
  }
}

/*extension E on CardText {
  CardText copyWith({
    final InlineSpan? textSpan,
    final StrutStyle? strutStyle,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final Locale? locale,
    final bool? softWrap,
    final TextOverflow? overflow,
    final double? textScaleFactor,
    final int? maxLines,
    final String? semanticsLabel,
    final TextWidthBasis? textWidthBasis,
    final TextHeightBehavior? textHeightBehavior,
    final Color? selectionColor,
    final CardNumberStyles? cardVariants,
  }) {
    return CardText(
      data!,
      textAlign: textAlign,
      textWidthBasis: textWidthBasis,
      maxLines: maxLines,
      textScaleFactor: textScaleFactor,
      softWrap: softWrap,
      overflow: overflow,
      selectionColor: selectionColor,
      key: key,
      locale: locale,
      semanticsLabel: data,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      cardVariants: cardVariants,
    );
  }
}*/

//cardVariants?.buildTextStyle() fontSize: 28,

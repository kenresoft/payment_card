import 'package:flutter/material.dart';
import 'package:payment_card/payment_card.dart';
import 'package:payment_card/src/util/extensions.dart';

/// A widget for displaying text on a payment card with customizable styles.
class CardText extends StatelessWidget {
  /// Creates a `CardText` widget.
  ///
  /// [data] is the text to display.
  /// [textSpan] is the text to display as a [InlineSpan].
  /// [style] is the style to use for this text.
  /// [strutStyle] is the strut style for the text.
  /// [textAlign] is how the text should be aligned horizontally.
  /// [textDirection] is the directionality of the text.
  /// [locale] is the locale to use for this text.
  /// [softWrap] specifies whether the text should break at soft line breaks.
  /// [overflow] is how visual overflow should be handled.
  /// [textScaleFactor] is the multiplier to apply to the fontSize to affect the text's size.
  /// [maxLines] is the maximum number of lines for the text to span.
  /// [semanticsLabel] is the label for the text.
  /// [textWidthBasis] is the strategy for resolving the intrinsic width of the text.
  /// [textHeightBehavior] is the configuration for the height of the text.
  /// [selectionColor] is the background color when the text is selected.
  /// [cardVariants] is the style variant for the text based on card number style.
  CardText(
    this.data, {
    super.key,
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
  })  : style = cardVariants?.buildTextStyle();

  /// The text to display.
  final String? data;

  /// The text to display as a [InlineSpan].
  final InlineSpan? textSpan;

  /// The style to use for this text.
  final TextStyle? style;

  /// The strut style for the text.
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// The locale to use for this text.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The multiplier to apply to the fontSize to affect the text's size.
  final double? textScaleFactor;

  /// The maximum number of lines for the text to span.
  final int? maxLines;

  /// The label for the text.
  final String? semanticsLabel;

  /// The strategy for resolving the intrinsic width of the text.
  final TextWidthBasis? textWidthBasis;

  /// The configuration for the height of the text.
  final TextHeightBehavior? textHeightBehavior;

  /// The background color when the text is selected.
  final Color? selectionColor;

  /// The style variant for the text based on card number style.
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

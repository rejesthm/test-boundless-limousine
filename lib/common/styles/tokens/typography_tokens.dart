import 'package:flutter/material.dart';

class TypographyTokens {
  TypographyTokens._();
}

enum FontToken { defaultFont }

enum FontStyleToken { regular, italic }

enum FontSizeToken {
  xs,
  sm,
  base,
  md,
  lg,
  xl,
  x2l,
  x3l,
  x4l,
  x5l,
  x6l,
  x7l,
  x8l,
  x9l,
  number,
}

enum FontWeightToken {
  light,
  regular,
  medium,
  semibold,
  bold,
  extraBold,
  black,
}

enum LetterSpacingToken {
  tighter,
  tight,
  normal,
  wide,
  wider,
  widest,
}

const fontValues = {
  FontToken.defaultFont: 'Figtree',
};

const fontStyleValues = {
  FontStyleToken.regular: FontStyle.normal,
  FontStyleToken.italic: FontStyle.italic,
};

const fontSizeValues = {
  FontSizeToken.xs: 12.0,
  FontSizeToken.sm: 14.0,
  FontSizeToken.base: 16.0,
  FontSizeToken.md: 18.0,
  FontSizeToken.lg: 20.0,
  FontSizeToken.xl: 24.0,
  FontSizeToken.x2l: 28.0,
  FontSizeToken.x3l: 32.0,
  FontSizeToken.x4l: 36.0,
  FontSizeToken.x5l: 40.0,
  FontSizeToken.x6l: 44.0,
  FontSizeToken.x7l: 48.0,
  FontSizeToken.x8l: 56.0,
  FontSizeToken.x9l: 64.0,
  FontSizeToken.number: 0.0,
};

const fontWeightValues = {
  FontWeightToken.light: FontWeight.w300,
  FontWeightToken.regular: FontWeight.w400,
  FontWeightToken.medium: FontWeight.w500,
  FontWeightToken.semibold: FontWeight.w600,
  FontWeightToken.bold: FontWeight.w700,
  FontWeightToken.extraBold: FontWeight.w800,
  FontWeightToken.black: FontWeight.w900,
};

const letterSpacingValues = {
  LetterSpacingToken.tighter: -0.8,
  LetterSpacingToken.tight: -0.4,
  LetterSpacingToken.normal: 0.0,
  LetterSpacingToken.wide: 0.4,
  LetterSpacingToken.wider: 0.8,
  LetterSpacingToken.widest: 1.6,
};

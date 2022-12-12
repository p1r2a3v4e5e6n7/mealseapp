import 'dart:ui';

import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

//const t5ColorPrimary = Color(0XFF5104D7);
final Color verifyButtoncolor = HexColor.fromHex('#0FA4DC');
final Color primaryColor = HexColor.fromHex('#6563CB');
final Color focuscolorotp = HexColor.fromHex('#E7F6FC');
final Color black = HexColor.fromHex('#000000');
final Color grey = HexColor.fromHex('#A0A0A0');
final Color blues = HexColor.fromHex('#0085FF');
final Color greyColor = HexColor.fromHex('#D2D2D2');
final Color border = HexColor.fromHex('#675BEF');
final blueLinear = HexColor.fromHex('#fffafa33');
final grayLinear = HexColor.fromHex('#FAFAFA');
final hexblueColor = HexColor.fromHex("#E9EEF0");
final hexRedColor = HexColor.fromHex('#F75555');
final hexBlueColor = HexColor.fromHex('#A1CCF2');
final hexgrey = HexColor.fromHex('#444343');
final liteGrey = HexColor.fromHex('#444343');
final hexbackground = HexColor.fromHex('#DBF2FA');

const colorPrimary = Color(0XFF5104D7);
const colorPrimaryDark = Color(0XFF325BF0);
const colorAccent = Color(0XFFD81B60);
const textColorPrimary = Color(0XFF130925);
const textColorSecondary = Color(0XFF888888);
const textColorThird = Color(0XFFBABFB6);
const textColorGrey = Color(0XFFB4BBC2);
const white = Color(0XFFFFFFFF);
const layoutBackgroundWhite = Color(0XFFF6F7FA);
const viewColor = Color(0XFFB4BBC2);
const skyBlue = Color(0XFF1fc9cd);
const darkNavy = Color(0XFF130925);
const cat1 = Color(0XFF45c7db);
const cat2 = Color(0XFF510AD7);
const cat3 = Color(0XFFe43649);
const cat4 = Color(0XFFf4b428);
const ca = Color(0XFF22ce9a);
const cat6 = Color(0XFF203afb);
const shadowColor = Color(0X95E9EBF0);
const darkRed = Color(0XFFF06263);
const colorPrimaryLight = Color(0X505104D7);

const teal = Colors.teal;

const learnerColorPrimary = Colors.lightBlue;
//const learner_colorPrimary = Color(0xFF345FFB);
const learnerColorBlue = Color(0xFF4da6ff);
const learnerBackgroundColor = Color(0xFFFAFAFA);
const learnerBlackColor = Color(0xFF000000);
const learnerGreyColor = Color(0xFF808080);
const learnerLayoutBackground = Color(0xFFF6F7FA);
const learnerWhite = Color(0xFFffffff);
const learnerTextColorSecondary = Color(0xFF778390);
const orangeColors = Color(0xffF5591F);
const orangeLightColors = Color(0xffF2861F);

const primaryBlue = Color(0xFF64B5F6);
const primaryLightBlue = Color(0xFF01579B);

const primaryBlue2 = Color(0xff5a348b);

const gray2 = Color(0xFFD6D6D6);
const gray3 = Color(0xFFE0E0E0);
const gray4 = Color(0xFFEEEEEE);

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);
final hextStageColor = HexColor.fromHex('#D9D9D9');

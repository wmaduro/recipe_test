import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget myRawMaterialButton({
  required BuildContext context,
  required VoidCallback callback,
  required String asset,
  double buttonHeightPercent = 0.05,
  double buttonPadding = 0,
  double elevation = 2.0,
  Color fillColor: Colors.white,
}) {
  Size size = MediaQuery.of(context).size;

  return RawMaterialButton(
    onPressed: callback,
    elevation: elevation,
    fillColor: fillColor,
    child: SvgPicture.asset(
      asset,
      height: size.height * buttonHeightPercent,
    ),
    padding: EdgeInsets.all(buttonPadding),
    shape: CircleBorder(),
  );
}

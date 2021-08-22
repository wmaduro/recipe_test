import 'package:flutter/material.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:recipe_test/shared/components/rounded_button.dart';

enum BodyInfoGenericEnum { ERROR, SUCCESSS, PROCESSING, INFO }
bodyInfoGeneric({
  required Widget content,
  required BodyInfoGenericEnum bodyInfoGenericEnum,
  required Function callBack,
}) {
  return Center(
    child: SizedBox(
      child: Center(
        child: TextButton(
          child: content, //Text('Type -> $bodyInfoGenericEnum : $message'),
          onPressed: () {
            callBack();
          },
        ),
      ),
    ),
  );
}

bodyErrorRefreshButtonGeneric({
  required BuildContext context,
  required Function callback,
}) {
  List<Widget> contentList = [
    Text('''
Ops!

Unfortunately we could not process your request successfully this time. 

Please, try again in few seconds.

    '''),
  ];
  return bodyOneActionGeneric(
      context: context,
      callback: callback,
      contentList: contentList,
      buttonText: 'Try Again');
}

bodyProcessinGeneric(
    {String message = 'Please wait... Your request is being processed.'}) {
  List<Widget> contentList = [
    Center(
        child: Column(
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 50,
        ),
        Text(message),
      ],
    )),
  ];
  return _baseCentralizedBody(contentList);
}

bodyOneActionGeneric({
  required BuildContext context,
  required Function callback,
  List<Widget> contentList = const <Widget>[],
  String buttonText = 'Refresh',
  double buttonWidthPercentage = .5,
}) {
  Size size = MediaQuery.of(context).size;

  contentList.addAll([
    SizedBox(height: size.height * 0.02),
    Center(
      child: RoundedButton(
        color: ColorsUtil.buttonGeneral,
        text: buttonText,
        widthPercentage: buttonWidthPercentage,
        press: () {
          callback();
        },
      ),
    ),
  ]);

  return _baseCentralizedBody(contentList);
}

_baseCentralizedBody(List<Widget> contentList) {
  return Center(
      child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: contentList,
            ),
          )));
}

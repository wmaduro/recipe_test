import 'package:flutter/material.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:recipe_test/shared/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextInputType textInputType;
  final int maxLength;

  const RoundedInputField({
    this.maxLength = 100,
    this.textEditingController,
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: textInputType,
        controller: textEditingController,
        onChanged: onChanged,
        cursorColor: ColorsUtil.textEditBorderGeneral,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorsUtil.textEditBorderGeneral,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

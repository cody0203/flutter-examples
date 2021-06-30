import 'package:flutter/material.dart';

import '../../models/facebook_input_types.dart';

class FacebookTextField extends StatelessWidget {
  final String label;
  final InputType type;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isEmailFocus;

  FacebookTextField({
    required this.label,
    required this.type,
    this.controller,
    this.focusNode,
    this.isEmailFocus,
  });

  @override
  Widget build(BuildContext context) {
    final showClearEmailIcon = isEmailFocus == true &&
        type == InputType.email &&
        controller!.text.isNotEmpty;
    final InputBorder inputBorder = type == InputType.password
        ? InputBorder.none
        : UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: Color(0xffcdcdcf),
            ),
          );
    return TextField(
      style: TextStyle(
        fontSize: 16,
      ),
      focusNode: focusNode,
      controller: controller,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: type == InputType.email
          ? TextInputType.emailAddress
          : TextInputType.visiblePassword,
      obscureText: type == InputType.password,
      textAlignVertical: TextAlignVertical.center,
      textInputAction:
          type == InputType.email ? TextInputAction.next : TextInputAction.go,
      decoration: InputDecoration(
        suffixIcon: showClearEmailIcon
            ? GestureDetector(
                onTap: () {
                  controller?.text = '';
                },
                child: Icon(
                  Icons.highlight_off,
                  color: Colors.grey,
                  size: 20,
                ),
              )
            : null,
        hintText: label,
        contentPadding: EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 15,
        ),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
      ),
    );
  }
}

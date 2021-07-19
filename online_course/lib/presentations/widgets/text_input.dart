import 'package:flutter/material.dart';

class MainTextInput extends TextField {
  MainTextInput({
    required String label,
    Widget? prefixIcon,
    InputDecoration? decoration,
  }) : super(
          decoration: InputDecoration(
            fillColor: Color(0xffFCFCFC),
            filled: true,
            hintText: label,
            hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffB7B7B7),
              height: 1.4285,
            ),
            prefixIcon: prefixIcon != null
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 12,
                    ),
                    child: prefixIcon,
                  )
                : null,
            contentPadding: const EdgeInsets.all(22),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(40),
            ),
          ).copyWith(
            fillColor: decoration?.fillColor,
            filled: decoration?.filled,
            enabledBorder: decoration?.enabledBorder,
            focusedBorder: decoration?.focusedBorder,
          ),
        );

  factory MainTextInput.outline({
    required String label,
    Widget? prefixIcon,
  }) = _MainTextInputOutlined;
}

class _MainTextInputOutlined extends MainTextInput {
  _MainTextInputOutlined({
    required String label,
    Widget? prefixIcon,
  }) : super(
          label: label,
          prefixIcon: prefixIcon,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Color.fromRGBO(189, 189, 189, 0.25),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Color.fromRGBO(189, 189, 189, 0.25),
              ),
            ),
          ),
        );
}

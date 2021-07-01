import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveSwitch extends StatelessWidget {
  final bool isActve;
  final Function(bool)? onChanged;

  const AdaptiveSwitch({
    required this.isActve,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSwitch(
            value: isActve,
            onChanged: onChanged,
            trackColor: const Color(
              0xff404040,
            ),
          )
        : Transform.scale(
            scale: 1.5,
            child: Switch(
              value: isActve,
              onChanged: onChanged,
              trackColor: MaterialStateProperty.all(
                Colors.white,
              ),
            ),
          );
  }
}

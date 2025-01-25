import 'package:flutter/material.dart';

import 'custom_image.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.onTap, required this.icon});

  final Function() onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(4),
            child: Center(child: CustomImage(path: icon))));
  }
}

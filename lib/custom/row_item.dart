import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';

Row rowItem(String? text, IconData icon){
  return Row(
    children: [
      Icon(icon,
          color: customTextColor,
          size: 15.0),
      const SizedBox(width: 3.0),
      Text(text ?? "N/A",
          style: const TextStyle(color: customTextLightColor)
      ),
    ],
  );
}
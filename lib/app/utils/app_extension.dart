import 'package:flutter/material.dart';

extension SizeBox on num {
  SizedBox get sbh => SizedBox(height: toDouble());
  SizedBox get sbw => SizedBox(width: toDouble());
}


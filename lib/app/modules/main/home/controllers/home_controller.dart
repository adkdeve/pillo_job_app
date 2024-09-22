import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final count = 0.obs;

  void increment() => count.value++;
 
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/heart_controller.dart';

class HeartView extends GetView<HeartController> {
  const HeartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HeartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HeartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

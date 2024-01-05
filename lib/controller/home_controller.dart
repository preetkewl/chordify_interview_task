import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/logs.dart';
import '../network/ApiService.dart';

class HomeController extends GetxController {


  final _loading = false.obs;

 final _colorMap = RxMap();

  get colorMap => _colorMap.value;
  get loading => _loading.value;

  @override
  void onInit() {
    super.onInit();
    _loading.value = true;
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final logs = await ApiService.getData();
      parseData(logs);
    } catch (e) {
      // Handle errors
      _loading.value = false;
      print('Error fetching data: $e');
    }
  }

  void parseData(Logs logs) {
    _loading.value = false;

    if (logs != null) {
      for (var log in logs.logs) {
        final date = log.date;
        final totalMg = log.totalMg;
        if (totalMg > 49) {
          _colorMap.value[date] = Colors.green;
        } else if (totalMg > 20 && totalMg <= 49) {
          _colorMap.value[date] = Colors.yellow;
        } else {
          _colorMap.value[date] = Colors.red;
        }
      }
    }
  }

}

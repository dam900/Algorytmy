import 'dart:math';
import 'package:quick_sort/custom_list.dart';
import 'package:quick_sort/loading_utilities.dart';
import 'package:quick_sort/quick_sort.dart' as quick_sort;

void main(List<String> arguments) {
  final List<int> numberOfElements = const [
    // 10,
    // 100,
    // 1000,
    // 10000,
    50000,
    100000,
    200000,
    300000,
    405360
  ];
  measureTimes(numberOfElements, quick_sort.quickSort);
}

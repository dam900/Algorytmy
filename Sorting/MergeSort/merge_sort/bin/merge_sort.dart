import 'dart:math';

import 'package:merge_sort/loading_utilities.dart';
import 'package:merge_sort/merge_sort.dart' as merge_sort;
import 'package:merge_sort/custom_list.dart';
import 'package:merge_sort/node.dart';

void main(List<String> arguments) {
  final List<int> numberOfElements = const [
    10,
    100,
    1000,
    10000,
    50000,
    100000,
    200000,
    300000,
    405360
  ];

  measureTimes(numberOfElements, merge_sort.mergeSort);
}

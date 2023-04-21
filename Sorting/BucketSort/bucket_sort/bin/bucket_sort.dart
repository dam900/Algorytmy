import 'package:bucket_sort/bucket_sort.dart' as bucket_sort;

import 'package:bucket_sort/loading_utilities.dart';

void main(List<String> arguments) async {
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
  measureTimes(numberOfElements, bucket_sort.bucketSort);
}

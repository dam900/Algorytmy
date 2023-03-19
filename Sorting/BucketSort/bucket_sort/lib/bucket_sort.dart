import 'package:bucket_sort/custom_list.dart';
import 'package:bucket_sort/insertion_sort.dart' as insertion_sort;

void bucketSort(DoubleLinkedList list) {
  DoubleLinkedList<DoubleLinkedList<int>> buckets = DoubleLinkedList();

  // Buckets subroutine
  int m = findMax(list);
  int startSize = list.size;
  int k = m ~/ startSize;
  for (int i = 0; i <= k; i++) {
    buckets.pushBack(DoubleLinkedList());
  }
  // Scatter subroutine
  for (int i = 0; i < startSize; i++) {
    var popedItem = list.popBack();
    var index = (k * popedItem ~/ m).floor();
    if (index >= k) {
      buckets.last.pushBack(popedItem);
      continue;
    }
    buckets.elementAt(index)!.pushBack(popedItem);
  }
  //Sorting subroutine
  buckets.forEach((element) => insertion_sort.insertionSort(element));
  //Gather subroutine
  buckets.forEach((element) => list.concat(element));
}

int findMax(DoubleLinkedList list) {
  int m = 0;
  list.forEach((element) {
    if (element > m) {
      m = element;
    }
  });
  return m;
}

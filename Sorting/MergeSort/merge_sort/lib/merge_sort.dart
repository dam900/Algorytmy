import 'package:merge_sort/custom_list.dart';

void mergeSort(DoubleLinkedList<int> list, int start, int end) {
  if (start < end) {
    int mid = (start + end) ~/ 2;
    mergeSort(list, start, mid);
    mergeSort(list, mid + 1, end);
    merge(list, start, mid, end);
  }
}

void merge(DoubleLinkedList<int> list, int start, int mid, int end) {
  int i = start;
  int j = mid + 1;
  if (list[mid] <= list[j]) {
    return;
  }

  while (i <= mid && j <= end) {
    if (list[i] <= list[j]) {
      i++;
    } else {
      int val = list.removeAt(j);
      list.insertAt(i, val);
      i++;
      j++;
      mid++;
    }
  }
}

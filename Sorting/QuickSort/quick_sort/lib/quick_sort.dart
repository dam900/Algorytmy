import 'package:quick_sort/custom_list.dart';

void quickSort(DoubleLinkedList<int> list, int left, int right){
    if (left < right){
      print('robi sie');
      int pivotIndex = _partition(list, left, right);
      quickSort(list, left, pivotIndex-1);
      quickSort(list, pivotIndex+1, right);
    }

}

int _partition(DoubleLinkedList<int> list, int left, int right){
  int x = list[right];
  int i = left-1;
  for (int j = left; j <= right-1; j++){
    if (list[j] < x){
      i++;
      list.swapValue(i, j);
    }
  }
  list.swapValue(i+1, right);
  return i+1;
}

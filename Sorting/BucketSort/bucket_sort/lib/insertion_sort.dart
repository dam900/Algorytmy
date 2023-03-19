import 'package:bucket_sort/node.dart';
import 'package:bucket_sort/custom_list.dart';

void insertionSort(DoubleLinkedList list) {
  Node? currNode = list.head;
  if (currNode == null){
      return;
    }
  Node? prevNode = currNode.prev;
  while (currNode != null) {
    var tmp = currNode;
    while (prevNode != null && currNode!.value < prevNode.value) {
      currNode.swap(prevNode);
      currNode = currNode.prev;
      prevNode = prevNode.prev;
    }

    currNode = tmp.next;
    if (currNode == null){
      break;
    }
    prevNode = currNode.prev;
  }

}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:merge_sort/node.dart';

class DoubleLinkedList<T> {
  Node<T>? _head;
  Node<T>? _tail;
  int _size = 0;

  DoubleLinkedList();

  int get size => _size;
  Node<T>? get head => _head;
  Node<T>? get tail => _tail;
  T get first => _head!.value;
  T get last => _tail!.value;

  T? elementAt(int index) {
    if (index == 0) {
      return this.first;
    }
    if (index > this._size) {
      return null;
    }
    int n = 0;
    late T elementToReturn;
    this.forEach((element) {
      if (n == index) {
        elementToReturn = element;
      }
      n++;
    });
    return elementToReturn;
  }

  void forEach(Function(T element) func) {
    Node<T>? currNode = _head;

    while (currNode != null) {
      func(currNode.value);
      currNode = currNode.next;
    }
  }

  void pushIterable(Iterable<T> iter) {
    for (var node in iter) {
      this.pushBack(node);
    }
  }

  // dodawanie elementu na koniec listy
  void pushBack(T value) {
    // jeżeli jest to pierwszy dodawany element to head i tail wskazują na siebie
    if (_head == null && _tail == null) {
      Node<T> newNode = Node(value: value);
      _tail = _head = newNode;
      _size++;
      return;
    }
    // każdy koleny element bieże tail za poprzednika i zostaje przypisany jako tail
    Node<T> newNode = Node(value: value, prev: _tail);
    _tail!.next = newNode;
    _tail = newNode;
    _size++;
  }

  T? popBack() {
    Node<T> popedNode = _tail!;
    _tail = _tail!.prev;
    _size--;
    return popedNode.value;
  }

  void printList() {
    Node<T>? currNode = _head;
    while (currNode != null) {
      print(currNode.toString());
      currNode = currNode.next;
    }
  }

  T operator [](int index) {
    return elementAt(index)!;
  }

  void concat(DoubleLinkedList<T> other) {
    if (other.head == null) {
      return;
    }
    if (this._size == 0) {
      this._head = other.head;
      this._tail = other.tail;
      this._size = other.size;
      return;
    }
    this._tail!.next = other.head;
    this._tail = other.tail;
    this._size += other.size;
  }

  void pushFront(T value){
    Node<T> newNode = Node(value: value, prev: null, next: this._head);
    this._head!.prev = newNode;
    this._head = newNode;
  }

  void insertAt(int index, T value){
    if (index == 0) {
      this.pushFront(value);
      return;
    }
    if (index == this._size){
      this.pushBack(value);
      return;
    }
    if (index > this._size) {
      print('out of bounds');
      return;
    }
    int n = 0;
    Node<T>? currNode = _head;
    late Node<T> elementAfter;
    late Node<T> elementBefore;
    while (currNode != null) {
      if (n == index){
        elementBefore = currNode.prev!;
        elementAfter = currNode;
        break;
      }
      n++;
      currNode = currNode.next;
    }
    Node<T> newNode = Node(value: value, prev: elementBefore, next: elementAfter);
    elementAfter.prev = newNode;
    elementBefore.next = newNode;

  }

  T removeAt(int index){
    late T valueToReturn;
    if (index == 0){
      valueToReturn = this._head!.value;
      this._head = this._head!.next;
      return valueToReturn;
    }
    if (index == this._size){
      valueToReturn = this._tail!.value;
      this._tail = this._tail!.prev;
      return valueToReturn;
    }
    int n = 0;
    Node<T>? currNode = _head;
    late Node<T> elementAfter;
    late Node<T> elementBefore;
    while (currNode != null) {
      if (n == index){
        elementBefore = currNode.prev!;
        elementAfter = currNode.next!;
        valueToReturn = currNode.value;
        break;
      }
      n++;
      currNode = currNode.next;
    }
    elementBefore.next = elementAfter;
    elementAfter.prev = elementBefore;
    return valueToReturn;
  }
}

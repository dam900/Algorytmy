class Node<T> {
  Node<T>? next;
  Node<T>? prev;
  T value;

  Node({required this.value, this.next, this.prev});

  @override
  String toString() => 'Node(value: $value)';

  void swap(Node<T> other){
    var tmp = other.value;
    other.value = this.value;
    this.value = tmp;
  }

  @override
  bool operator ==(covariant Node<T> other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
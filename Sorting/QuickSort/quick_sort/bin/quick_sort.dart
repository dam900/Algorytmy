import 'dart:math';
import 'package:quick_sort/custom_list.dart';
import 'package:quick_sort/quick_sort.dart' as quick_sort;

void main(List<String> arguments) {
  DoubleLinkedList<int> list = DoubleLinkedList();
  list.pushIterable(
      List.generate(15, (index) => Random().nextInt(index * index + 1)));
  list.printList();
  print('----------------');
  quick_sort.quickSort(list, 0, list.size - 1);
  list.printList();
  // list.printList();
  // list.swapValue(0, 3);
  // list.printList();
  // var stopwatch = Stopwatch()..start();
  // print(list.elementAt(0));
  // stopwatch.stop();
  // print('Czas wykonania 0 : ${stopwatch.elapsedMilliseconds / 1000}s');
  // stopwatch.start();
  // print(list[0]);
  // stopwatch.stop();
  // print('Czas wykonania 100000: ${stopwatch.elapsedMilliseconds / 1000}s');
  // var file = File(
  //     r'C:\Users\Damian\Desktop\nauka\ISA_semestr_4\Algorytmy\Projekt\Sorting\dane.csv');
  // var contentsStream = file
  //     .openRead()
  //     .transform(utf8.decoder) // convert bytes to UTF-8 strings
  //     .transform(LineSplitter())
  //     .map((event) => event.split(',')); // split strings into lines

  // int i = 0;
  // int size = 0;
  // await for (var line in contentsStream) {
  //   if (size == 1000) {
  //     break;
  //   }
  //   if (i == 0) {
  //     i++;
  //     continue;
  //   }

  //   try {
  //     var parsed = int.tryParse(line[2].split('.')[0]);
  //     if (parsed == null) {
  //       i++;
  //       continue;
  //     }
  //     list.pushBack(parsed);
  //     size++;
  //   } catch (e) {
  //     print(line);
  //     print(e);
  //   }
  //   i++;
  // }
  // print(size);
  // print(i);
}

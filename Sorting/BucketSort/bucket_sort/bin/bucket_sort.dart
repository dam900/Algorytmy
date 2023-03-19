import 'package:bucket_sort/bucket_sort.dart' as bucket_sort;
import 'package:bucket_sort/custom_list.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) async {
  DoubleLinkedList<int> list = DoubleLinkedList();

  var file = File(
      r'C:\Users\Damian\Desktop\nauka\ISA_semestr_4\Algorytmy\Projekt\Sorting\dane.csv');
  var contentsStream = file
      .openRead()
      .transform(utf8.decoder) // convert bytes to UTF-8 strings
      .transform(LineSplitter())
      .map((event) => event.split(',')); // split strings into lines

  int i = 0;
  int size = 0;
  await for (var line in contentsStream) {
    if (size == 1000) {
      break;
    }
    if (i == 0) {
      i++;
      continue;
    }

    try {
      var parsed = int.tryParse(line[2].split('.')[0]);
      if (parsed == null) {
        i++;
        continue;
      }
      list.pushBack(parsed);
      size++;
    } catch (e) {
      print(line);
      print(e);
    }
    i++;
  }
  print(size);
  print(i);

  var stopwatch = Stopwatch()..start();
  bucket_sort.bucketSort(list);
  stopwatch.stop();

  print('Czas wykonania: ${stopwatch.elapsedMilliseconds / 1000}s');
}

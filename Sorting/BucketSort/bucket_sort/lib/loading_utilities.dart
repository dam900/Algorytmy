import 'dart:convert';
import 'dart:io';

import 'package:bucket_sort/custom_list.dart';

void measureTimes(
    List<int> numberOfElementsToMeasure, Function sortingAlogrithm) async {
  final List<int> numberOfElements = numberOfElementsToMeasure;

  List<DoubleLinkedList<int>> loadedLists = [];
  for (final bound in numberOfElements) {
    DoubleLinkedList<int> loadedList = await loadFromFile(bound);
    loadedLists.add(loadedList);
    print('---------');
    print('size: ${loadedList.size}');
    print('---------');
  }

  for (final list in loadedLists) {
    var stopwatch = Stopwatch()..start();
    sortingAlogrithm(list);
    stopwatch.stop();
    print(
      'Czas wykonania dla ${list.size} elementów: ${stopwatch.elapsedMilliseconds / 1000}s',
    );
  }
}

Future<DoubleLinkedList<int>> loadFromFile(int bound) async {
  DoubleLinkedList<int> list = DoubleLinkedList();

  var file = File(
      r'C:\Users\Damian\Desktop\nauka\ISA_semestr_4\Algorytmy\Projekt\Sorting\dane.csv');
  var contentsStream = file
      .openRead()
      .transform(utf8.decoder) // convert bytes to UTF-8 strings
      .transform(LineSplitter())
      .map((event) => event.split(',')); // split strings into lines

  int size = 0;
  await for (var line in contentsStream) {
    if (size == bound) {
      break;
    }

    try {
      var parsed = int.tryParse(line[2].split('.')[0]);
      if (parsed == null) {
        continue;
      }
      list.pushBack(parsed);
      size++;
    } catch (e) {
      print(line);
      print(e);
    }
  }

  return list;
}

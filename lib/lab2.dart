import 'dart:io';

import 'package:dart_labs/labs.dart';
import 'package:dart_labs/inputHelpers.dart';

Lab initLab2() {
  Exercise op2 = Exercise(
    2,
    '''Пользователь вводит с клавиатуры 2 значения val1, val2. Посчитайте 
их произведение и выведите полученный результат в терминал.''',
    () {
      var val1 = inputDouble(message: 'Enter val1:');
      var val2 = inputDouble(message: 'Enter val2:');
      print('Result: ${val1 * val2}');
    }
  );

  Exercise op9 = Exercise(
    9,
    '''Пользователь вводит целочисленный список myList из 8 элементов. 
Найдите произведение его второго и среднего элемента и выведите 
полученный результат в терминал.''',
    () {
      var myList = inputIntArr(message: 'Enter 8 integers:');
      if (myList.length != 8) {
        print('Error: List must contain exactly 8 elements.');
        return;
      }
      int second = myList[1];
      int middle = myList[4];
      print('Result: ${second * middle}');
    }
  );

  Exercise op15 = Exercise(
    15,
    '''На вход подается целочисленное значение n. Используя его, получите 
решение для следующего выражения и выведите полученный результат в 
терминал: (tan(n) - 2n) / sqrt(10 + 0.6n)''',
    () {
      var n = inputInt(message: 'Enter n:');
      var result = (tan(n) - 2 * n) / sqrt(10 + 0.6 * n);
      print('Result: $result');
    }
  );

  Exercise op16 = Exercise(
    16,
    '''На вход подается целочисленное значение n. Используя его, получите 
решение для следующего выражения и выведите полученный результат в 
терминал: (3sin(n) - 15) / sqrt(n^5)''',
    () {
      var n = inputInt(message: 'Enter n:');
      if (n == 0) {
        print('Error: Division by zero is not allowed.');
        return;
      }
      var result = (3 * sin(n) - 15) / sqrt(pow(n, 5));
      print('Result: $result');
    }
  );

  Exercise op19 = Exercise(
    19,
    '''На вход подается целочисленное значение n. Используя его, получите 
решение для следующего выражения и выведите полученный результат в 
терминал: (2n^2 - 4n + 10) / 2n''',
    () {
      var n = inputInt(message: 'Enter n:');
      if (n == 0) {
        print('Error: Division by zero is not allowed.');
        return;
      }
      var result = (2 * pow(n, 2) - 4 * n + 10) / (2 * n);
      print('Result: $result');
    }
  );

  Exercise ptrn2 = Exercise(
    2,
    '''Пользователь вводит целочисленный список. Используя шаблон 
выведите его в терминал, если список удовлетворяет следующим условиям: 
0  <  длина <  15, первый элемент равен 7, а последний 15. Иначе выведите 
текст «Pattern no matched». ''',
    () {
      var myList = inputIntArr(message: 'Enter integer list:');
      if (myList.isNotEmpty && myList.length < 15 && myList.first == 7 && myList.last == 15) {
        print('Matched list: $myList');
      } else {
        print('Pattern no matched');
      }
    }
  );

  Exercise ptrn5 = Exercise(
    5,
    '''Пользователь вводит целочисленный список. Используя шаблон 
выведите его в терминал, если список удовлетворяет следующим условиям: 
первый элемент равен последнему и сумма всех элементов списка больше 
40. Иначе выведите текст «Pattern no matched».''',
    () {
      var myList = inputIntArr(message: 'Enter integer list:');
      if (myList.isNotEmpty && myList.first == myList.last && myList.reduce((a, b) => a + b) > 40) {
        print('Matched list: $myList');
      } else {
        print('Pattern no matched');
      }
    }
  );

  Exercise ptrn6 = Exercise(
    6,
    '''Пользователь вводит Map<String, int>. Используя шаблон выведите 
его в терминал, если удовлетворяет следующим условиям: имеется ключ со 
значением «Key» и произведение всех хранимых значений больше 38. 
Иначе выведите текст «Pattern no matched».''',
    () {
      var myMap = {"Key": 2, "Value": 20};
      if (myMap.containsKey("Key") && myMap.values.reduce((a, b) => a * b) > 38) {
        print('Matched map: $myMap');
      } else {
        print('Pattern no matched');
      }
    }
  );

  Exercise ptrn7 = Exercise(
    7,
    '''Используя деструктурирование организуйте извлечение значений из 
объекта Map или List:
{ 
    "name": "Alex", 
    "age": 35, 
    "course": 2, 
    "single": true, 
    "description": [ 
        "Мечтатель", 
        "Ленив", 
        "Студент", 
        "Постоянно жалуется на жизнь" 
    ] 
} 
 
Извлеките  список description,  имя  и  возраст. 
Выведите в терминал полученный результат.''',
    () {
      
    }
  );

  Exercise ptrn15 = Exercise(
    15,
    '''Используя деструктурирование организуйте извлечение значений из 
объекта Map или List: 
(23, 89, pef:'Oo', pruf: 3.976) 
 
Извлеките  из  записи  только  позиционные  поля  и 
выведите в терминал их разность''',
    () {
      
    }
  );

  return Lab(2, 'Задания на арифметические операции', [
    LabPart(1, 'Арифметические операции', [op2, op9, op15, op16, op19]),
    LabPart(2, 'Задания на шаблоны', [ptrn2, ptrn5, ptrn6, ptrn7, ptrn15])
  ]);
}
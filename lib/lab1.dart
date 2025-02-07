import 'dart:io';

import 'package:dart_labs/labs.dart';

Lab initLab1() {
	var strEx1 = Exercise(
		1, 
		'''Напишите приложение, где пользователь вводит строку и букву,
наличие которой предстоит проверить в введенной строке. Выведите в
терминал полученный результат в терминал, а также индекс последнего
вхождения буквы в строку''', 
		() {
			print("Enter string: ");
			String str = stdin.readLineSync() ?? "";
			String char;
			do{
				print("Enter char: ");
				char = stdin.readLineSync() ?? "";
			} while (char.length != 1);

			var lastIdx = str.lastIndexOf(char);
			if (lastIdx == -1) {
				print("Char is not found");
			}
			else {
				print("Last index = $lastIdx");
			}
		}
	);	

	var strEx3 = Exercise(
		3, 
		'''Напишите приложение, где пользователь вводит строку и букву.
Посчитайте сколько раз заданная буква входит в строку и выведите
полученный результат, а также индекс первого вхождения буквы в строку,
в терминал''', 
		() {
			print("Enter string: ");
			String str = stdin.readLineSync() ?? "";
			String char;
			do{
				print("Enter char: ");
				char = stdin.readLineSync() ?? "";
			} while (char.length != 1);

			var matches = char.allMatches(str);
			if (matches.isEmpty) {
				print("Char is not found");
			}
			else {
				print("Matches count = ${matches.length}");
				print("First index = ${str.indexOf(char)}");
			}
		}
	);

	var strEx7 = Exercise(
		7, 
		'''Напишите приложение, где пользователь вводит две строки str1 и str2.
Программа должна создать новую строку str3 путем добавления str2 в
середину str1. Полученный результат выведите в терминал. Например: str1
= «Мама», str2 = «Раму» -> «МаРамума»''', 
		() {
			print("Enter string 1:");
			String str1 = stdin.readLineSync() ?? "";
			print("Enter string 2:");
			String str2 = stdin.readLineSync() ?? "";
			
			int halfLen = (str1.length / 2).round();
			print("Result: ${str1.substring(0, halfLen)}$str2${str1.substring(halfLen)}");
		}
	);

	var listEx17 = Exercise(
		17, 
		'''Напишите приложение, позволяющее пользователю вводить
список строковых значений и два числа (например a и b). Программа
должна удалить в списке все элементы, которые лежат в диапазоне от
индекса «a» по «b». Выведите в терминал полученный результат''', 
		() {
			print("Enter list:");
			List<String> list = stdin.readLineSync()
									?.split(" ") ?? [];
			
			print("Enter start index: ");
			int startIdx = int.parse(stdin.readLineSync() ?? "");
			print("Enter end index: ");
			int endIdx = int.parse(stdin.readLineSync() ?? "");

      list.removeRange(startIdx, endIdx);

			print(list);
		}
	);

	var listEx18 = Exercise(
		18, 
		'''Напишите приложение, позволяющее пользователю вводить
список целочисленных значений. Сформируйте новый список, элементы
которого – четные значения. Выведите в терминал полученный результат.''', 
		() {
			print("Enter list:");
			print(stdin.readLineSync()
				?.split(" ")
				.map((e) => int.parse(e))
				.toList()
				.where((e) => e % 2 == 0) ?? []);
		}
	);

	var listEx19 = Exercise(
		19, 
		'''Напишите приложение, позволяющее пользователю вводить
список целочисленных значений. Сформируйте новый список, элементы
которого – нечетные значения. Выведите в терминал полученный
результат.''', 
		() {
			print("Enter list:");
			print(stdin.readLineSync()
				?.split(" ")
				.map((e) => int.parse(e))
				.toList()
				.where((e) => e % 2 == 1) ?? []);
		}
	);

  var listEx20 = Exercise(
		20, 
		'''Напишите приложение, позволяющее пользователю вводить
список целочисленных значений и два числа (например a и b). Посчитайте
сумму элементов списка, которые лежат в диапазоне от индекса «a» по «b».
Выведите в терминал полученный результат.''', 
		() {
			print("Enter list:");
			List<int> list = stdin.readLineSync()
									?.split(" ")
                  .map((e) => int.parse(e))
                  .toList() ?? [];
			
			print("Enter start index: ");
			int startIdx = int.parse(stdin.readLineSync() ?? "");
			print("Enter end index: ");
			int endIdx = int.parse(stdin.readLineSync() ?? "");

			print(list.sublist(startIdx, endIdx).reduce((val, e) => val + e));
		}
	);

	var setEx5 = Exercise(
		5,
		'''Напишите приложение, позволяющее пользователю вводить список
целочисленных значений и число A. Сформируйте множество, значения
элементов которого > A. Выведите в терминал полученный результат.
''', 
		() {
			print("Enter list: ");
			var list = stdin.readLineSync()
						?.split(" ")
						.map((e) => int.parse(e)) ?? [];
			
			print("Enter A:");
			var A = int.parse(stdin.readLineSync() ?? "");

			print(list.where((e) => e > A).toSet());
		}
	);

	var setEx14 = Exercise(
		14,
		'''Напишите приложение, позволяющее пользователю вводить
целочисленное множество и число A. Удалите из множества значение A,
после чего уменьшите хранящиеся в нем значения на А и посчитайте сумму
элементов. Выведите в терминал полученный результат''', 
		() {
			print("Enter list: ");
			var set = stdin.readLineSync()
						?.split(" ")
						.map((e) => int.parse(e)) 
						.toSet() ?? {};
			
			print("Enter A:");
			var A = int.parse(stdin.readLineSync() ?? "");

		    set.remove(A);

			print(set.map((e) => e - A).reduce((value, element) => value + element));
		}
	);

	var setEx15 = Exercise(
		15,
		'''Напишите приложение, позволяющее пользователю вводить строку.
Сформируйте новую строку, состоящую только из уникальных символов, и
выведите ее в терминал''', 
		() {
			print("Enter string:");
			print(stdin.readLineSync()?.split("").toSet().join());
		}
	);

	var setEx17 = Exercise(
		17,
		'''Напишите приложение, позволяющее пользователю вводить два
множества А и В. Найдите разницу А-В и оставьте в получившимся
множестве только те элементы, значения которых > 10. Выведите в
терминал полученный результат.''', 
		() {
			print("Enter set A:");
			var setA = stdin.readLineSync()
						?.split(" ")
						.map((e) => int.parse(e))
						.toSet() ?? {};

      print("Enter set B:");
			var setB = stdin.readLineSync()
						?.split(" ")
						.map((e) => int.parse(e))
						.toSet() ?? {};

			print(setA.difference(setB).where((e) => e > 10));
		}
	);

	var mapEx6 = Exercise(
		6,
		'''Напишите приложение, позволяющее пользователю вводить Map<int, 
double>  и  число  A.  Удалите  все  элементы  Map,  значения  которых  >  A  и 
выведите в терминал полученный результат. 
''',
		() {
			print("Enter Map<int, double>");
			print("Enter list of keys: ");
			var keys = stdin.readLineSync()
						?.split(" ")
						.map((e) => int.parse(e)) ?? [];

      print("Enter list of values: ");
			var values = stdin.readLineSync()
							?.split(" ")
							.map((e) => double.parse(e)) ?? [];

			var map = Map.fromIterables(keys, values);

			print("Enter A: ");
			var A = double.parse(stdin.readLineSync() ?? "");

			map.removeWhere((key, value) => value > A);

			print(map);
		}
	);

	var mapEx8 = Exercise(
		8,
		'''Напишите приложение, позволяющее пользователю вводить Map<int, 
String> и строку А. Удалите все элементы значения которых начинаются с 
подстроки А и выведите в терминал полученный результат.''',
		() {
			print("Enter Map<int, String>");
			print("Enter list of keys: ");
			var keys = stdin.readLineSync()
						?.split(" ")
						.map((e) => int.parse(e)) ?? [];

      print("Enter list of values: ");
			var values = stdin.readLineSync()
							?.split(" ") ?? [];

			var map = Map.fromIterables(keys, values);

			print("Enter A: ");
			var A = stdin.readLineSync() ?? "";		

			map.removeWhere((key, value) => value.startsWith(A));

			print(map);
		}
	);

	var mapEx10 = Exercise(
		10,
		'''Напишите приложение, позволяющее пользователю вводить Map<int, 
double>  и число A. Удалите все элементы значения ключей которых <=  A. 
Выведите в терминал полученный результат и сумму всех значений Map. ''',
		() {
			print("Enter Map<int, double>");
			print("Enter list of keys: ");
			var keys = stdin.readLineSync()
						?.split(" ")
						.map((e) => int.parse(e)) ?? [];

      print("Enter list of values: ");
			var values = stdin.readLineSync()
							?.split(" ")
							.map((e) => double.parse(e)) ?? [];

			var map = Map.fromIterables(keys, values);

			print("Enter A: ");
			var A = double.parse(stdin.readLineSync() ?? "");

			map.removeWhere((key, value) => key <= A);

			print(map);
      print(map.values.reduce((value, element) => value + element));
		}
	);

	var strPart = LabPart(
		1, 
		"Задания по строкам",
		[strEx1, strEx3, strEx7]
	);

	var listPart = LabPart(
		2, 
		"Задания по спискам", 
		[listEx17, listEx18, listEx19, listEx20]
	);

	var setPart = LabPart(
		3, 
		"Задания по множествам", 
		[setEx5, setEx14, setEx15, setEx17]
	);

	var mapPart = LabPart(
		4, 
		"Задания по мэпам (таблицам / картам)",
		[mapEx6, mapEx8, mapEx10]
	);

	return Lab(
		1,
		"Встроенные типы данных Dart",
		[strPart, listPart, setPart, mapPart]
	);
}
import 'dart:io';

double inputDouble({String message = 'Enter double value:'}) {
  while(true) {
    print(message);
    double? val = double.tryParse(stdin.readLineSync() ?? "");
    if (val == null) {
      print('Invalid input');
      print('Try again');
    }
    else {
      return val;
    }
  }
}

int inputInt({String message = 'Enter int value:'}) {
  while(true) {
    print(message);
    int? val = int.tryParse(stdin.readLineSync() ?? "");
    if (val == null) {
      print('Invalid input');
      print('Try again');
    }
    else {
      return val;
    }
  }
}

List<int> inputIntArr({String message = 'Enter int list:'}) {
  while(true) {
    print(message);
    List<int?> list = stdin.readLineSync()
                ?.split(' ')
                .map((e) => int.tryParse(e))
                .toList() ?? [];

    if (list.any(((e) => e == null))) {
      print('Invalid input');
      print('Try again');
    }
    else {
      return list.nonNulls.toList();
    }
  }
}
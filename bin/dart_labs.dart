import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_labs/labs.dart';

const String version = '0.5.0';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'debug',
      abbr: 'd',
    )
    ..addFlag(
      'version',
      negatable: false,
      help: 'Print the tool version.',
    )
    ..addOption(
      'lab',
      abbr: 'l',
    )
    ..addOption(
      'part',
      abbr: 'p'
    )
    ..addOption(
      'exercise',
      abbr: 'e'
    );
}

void printUsage(ArgParser argParser) {
  print('Usage: dart_labs <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);
    final LabManager labManager = initManager();

    int? labNum = int.tryParse(results.option('lab') ?? ''); 
    int? partNum = int.tryParse(results.option('part') ?? '');
    int? exNum = int.tryParse(results.option('exercise') ?? '');

    // Process the parsed arguments.
    if (results.flag('help')) {
      printUsage(argParser);
      return;
    }
    if (results.flag('version')) {
      print('dart_labs version: $version');
      return;
    }
    if (results.flag('debug')) {
      print('All arguments: ${results.arguments}');
      print('All options: ${results.options}');
    }

    if (labNum == null) {
      print("Please select lab.");
    } else {
      if (partNum == null) {
        if (labManager.getLabPartsCount(labNum) > 1) {
          while (true) {
            print('This lab have more than one part.');
            print("Start everything in order? (Y / N): ");
            var response = stdin.readLineSync()?.toUpperCase();
            if (response == 'Y') {
              labManager.start(labNum);
              return;
            }
            else if (response == 'N') {
              return;
            }
          } 
        } else {
          if (exNum == null) {
            while (true) {
              print("You have not selected exercise.");
              print("Start everything in order? (Y / N): ");
              var response = stdin.readLineSync()?.toUpperCase();
              if (response == 'Y') {
                labManager.start(labNum, 1);
                return;
              }
              else if (response == 'N') {
                return;
              }
            } 
          } else {
            labManager.start(labNum, 1, exNum);
          }
        }
      } else {
        if (exNum == null) {
          while (true) {
            print("You have not selected exercise.");
            print("Start everything in order? (Y / N): ");
            var response = stdin.readLineSync()?.toUpperCase();
            if (response == 'Y') {
              labManager.start(labNum, partNum);
              return;
            }
            else if (response == 'N') {
              return;
            }
          } 
        } else {
          labManager.start(labNum, partNum, exNum);
        }
      }
    } 

  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}
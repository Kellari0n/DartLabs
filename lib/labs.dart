import 'package:dart_labs/lab1.dart';

class LabManager {
  final List<Lab> _labs = [];

  void addLab(Lab lab) {
    _labs.add(lab);
  }

  int getLabPartsCount(int labNum) {
    return _labs.firstWhere((l) => l._number == labNum).getPartsCount();
  }

  void start([int? labNum, int? partNum, int? exNum]) {
    if (labNum == null) {
      for (var lab in _labs) {
        lab.startLab();
      }
    }
    else {
      if (partNum == null) {
        _labs.firstWhere((p) => p._number == labNum).startLab();
      }
      else {
        if (exNum == null) {
          _labs.firstWhere((p) => p._number == labNum).startLab(partNum);
        }
        else {
          _labs.firstWhere((p) => p._number == labNum).startLab(partNum, exNum);
        }
      }
    }
  }
}

class Lab {
	final int _number;
	final String _name;
	final List<LabPart> _parts;
	
	Lab(this._number, this._name, this._parts);

  int getPartsCount() { return _parts.length; }

  void startLab([int? partNum, int? exNum]) {
    print("Lab $_number. $_name:");
    if (partNum == null) {
      for (var part in _parts) {
        part.startPart();
      }
    }
    else{
      if (exNum == null) {
        _parts.firstWhere((p) => p._number == partNum).startPart();
      }
      else {
        _parts.firstWhere((p) => p._number == partNum).startPart(exNum);
      }
    }
  }
}

class LabPart {
	final int _number;
	final String _name;
	final List<Exercise> _exercises;

	LabPart(this._number, this._name, this._exercises);

  void startPart([int? exNum]) {
    print("Part $_number. $_name:");
    if (exNum == null) {
      for (var ex in _exercises) {
        ex.startExercise();
      }
    }
    else {
      _exercises.firstWhere((ex) => ex._number == exNum).startExercise();
    }
  }
}

class Exercise {  
	final int _number;
	final String _exercise;
	final Function? _solution;

	Exercise(this._number, this._exercise, this._solution);

  void startExercise() {
    print("Exercise $_number:");
    print(_exercise);
    if (_solution != null) {
      _solution();
    }
    else {
      print("Exercise has no solution");
    }
  }
}

LabManager initManager() {
  var labManager = LabManager();

  labManager.addLab(InitLab1());

  return labManager;
}
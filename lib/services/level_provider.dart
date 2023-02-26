import 'package:flutter/material.dart';
import 'package:zad_academy/models/level_model.dart';
import 'package:zad_academy/models/material_model.dart';
import 'package:zad_academy/models/subject_model.dart';

import '../data/data_hub.dart';

class LevelProvider extends ChangeNotifier {
  int _levelIndex = 0;

  getLevelIndex(int index) {
    _levelIndex = index;
    notifyListeners();
  }

  LevelModel getLevelData() {
    LevelModel? level;

    switch (_levelIndex) {
      case 1:
        level = levels[0];
        break;
      case 2:
        level = levels[1];
        break;
      case 3:
        level = levels[2];
        break;
      case 4:
        level = levels[3];
        break;
    }
    return level!;
  }

  int _subjectIndex = 0;

  getSubjectIndex(int index) {
    _subjectIndex = index;
    notifyListeners();
  }

  SubjectModel getSubjectData() {
    SubjectModel? subject;
    switch (_subjectIndex) {
      case 1:
        subject = subjects[0];
        break;
      case 2:
        subject = subjects[1];
        break;
      case 3:
        subject = subjects[2];
        break;
      case 4:
        subject = subjects[3];
        break;
      case 5:
        subject = subjects[4];
        break;
      case 6:
        subject = subjects[5];
        break;
      case 7:
        subject = subjects[6];
        break;
    }
    return subject!;
  }

  int _materialIndex = 0;

  getMaterialIndex(int index) {
    _materialIndex = index;
    notifyListeners();
  }

  MaterialModel getMaterialData() {
    MaterialModel? material;
    switch (_materialIndex) {
      case 1:
        material = materials[0];
        break;
      case 2:
        material = materials[1];
        break;
      case 3:
        material = materials[2];
        break;
      case 4:
        material = materials[3];
        break;
    }
    return material!;
  }
}

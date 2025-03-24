import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/task.dart';

class HiveDataStore {
  static const boxName = "tasksBox";
  final Box<Task> box = Hive.box<Task>(boxName);

  /// Add new Task
  Future<void> addTask({required Task task}) async {
    await box.put(task.id, task);
  }

  /// Show task
  Task? getTask({required String id}) {
    return box.get(id);
  }

  /// Update task
  Future<void> updateTask({required Task task}) async {
    await box.put(task.id, task);
  }

  /// Delete task
  Future<void> deleteTask({required Task task}) async {
    await task.delete();
  }

  ValueListenable<Box<Task>> listenToTask() {
    return box.listenable();
  }
}

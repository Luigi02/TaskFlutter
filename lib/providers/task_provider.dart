import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class TaskProvider with ChangeNotifier {
  final SupabaseRepository _repo = SupabaseRepository();

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> listTasksByGroup(String groupId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _tasks = await _repo.listTasksByGroup(groupId);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createTask(Task task) async {
    try {
      await _repo.createTask(task);
      _tasks.add(task);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _repo.deleteTask(taskId);
      _tasks.removeWhere((task) => task.id == taskId);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _repo.updateTask(task);
      final index = _tasks.indexWhere((element) => element.id == task.id);
      _tasks[index] = task;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // Método para contar as tarefas completadas
  int completedTasksCount() {
    return _tasks.where((task) => task.isCompleted).toList().length;
  }

  // Método para contar o total de tarefas
  int totalTasksCount() {
    return _tasks.length;
  }
}

import 'package:flutter/material.dart';
import 'package:copilot_todo_demo/models/todo.dart';
import 'package:copilot_todo_demo/services/local_storage_service.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  String _searchQuery = '';
  Priority? _filterPriority;
  bool _showCompletedOnly = false;

  List<Todo> get todos {
    List<Todo> filteredTodos = _todos;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredTodos = filteredTodos.where((todo) =>
          todo.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (todo.description?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false)
      ).toList();
    }

    // Apply priority filter
    if (_filterPriority != null) {
      filteredTodos = filteredTodos.where((todo) => todo.priority == _filterPriority).toList();
    }

    // Apply completion filter
    if (_showCompletedOnly) {
      filteredTodos = filteredTodos.where((todo) => todo.isCompleted).toList();
    }

    return filteredTodos;
  }

  List<Todo> get allTodos => _todos;
  String get searchQuery => _searchQuery;
  Priority? get filterPriority => _filterPriority;
  bool get showCompletedOnly => _showCompletedOnly;

  int get completedCount => _todos.where((todo) => todo.isCompleted).length;
  int get pendingCount => _todos.where((todo) => !todo.isCompleted).length;
  int get totalCount => _todos.length;

  TodoProvider() {
    loadTodos();
  }

  Future<void> loadTodos() async {
    _todos = await LocalStorageService.getTodos();
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
    await _saveTodos();
    notifyListeners();
  }

  Future<void> updateTodo(Todo updatedTodo) async {
    final index = _todos.indexWhere((todo) => todo.id == updatedTodo.id);
    if (index != -1) {
      _todos[index] = updatedTodo;
      await _saveTodos();
      notifyListeners();
    }
  }

  Future<void> deleteTodo(String id) async {
    _todos.removeWhere((todo) => todo.id == id);
    await _saveTodos();
    notifyListeners();
  }

  Future<void> toggleTodoCompletion(String id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final todo = _todos[index];
      _todos[index] = todo.copyWith(
        isCompleted: !todo.isCompleted,
        completedAt: !todo.isCompleted ? DateTime.now() : null,
      );
      await _saveTodos();
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setFilterPriority(Priority? priority) {
    _filterPriority = priority;
    notifyListeners();
  }

  void setShowCompletedOnly(bool showCompleted) {
    _showCompletedOnly = showCompleted;
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _filterPriority = null;
    _showCompletedOnly = false;
    notifyListeners();
  }

  Future<void> _saveTodos() async {
    await LocalStorageService.saveTodos(_todos);
  }

  Future<void> clearAllTodos() async {
    _todos.clear();
    await _saveTodos();
    notifyListeners();
  }

  Future<void> deleteCompletedTodos() async {
    _todos.removeWhere((todo) => todo.isCompleted);
    await _saveTodos();
    notifyListeners();
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:copilot_todo_demo/providers/todo_provider.dart';
import 'package:copilot_todo_demo/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('TodoProvider Tests', () {
    setUp(() async {
      // Set up shared preferences for testing
      SharedPreferences.setMockInitialValues({});
    });

    test('should initialize with empty todos', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero); // Wait for loadTodos to complete
      
      expect(provider.todos, isEmpty);
      expect(provider.totalCount, 0);
      expect(provider.completedCount, 0);
      expect(provider.pendingCount, 0);
    });

    test('should add todo successfully', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        createdAt: DateTime.now(),
      );

      await provider.addTodo(todo);

      expect(provider.todos.length, 1);
      expect(provider.todos.first.title, 'Test Todo');
      expect(provider.totalCount, 1);
      expect(provider.pendingCount, 1);
      expect(provider.completedCount, 0);
    });

    test('should toggle todo completion', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        createdAt: DateTime.now(),
      );

      await provider.addTodo(todo);
      await provider.toggleTodoCompletion('1');

      expect(provider.todos.first.isCompleted, true);
      expect(provider.completedCount, 1);
      expect(provider.pendingCount, 0);
    });

    test('should filter todos by search query', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      final todo1 = Todo(
        id: '1',
        title: 'Buy groceries',
        createdAt: DateTime.now(),
      );
      
      final todo2 = Todo(
        id: '2',
        title: 'Walk the dog',
        createdAt: DateTime.now(),
      );

      await provider.addTodo(todo1);
      await provider.addTodo(todo2);

      provider.setSearchQuery('grocery');

      expect(provider.todos.length, 1);
      expect(provider.todos.first.title, 'Buy groceries');
    });

    test('should filter todos by priority', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      final todo1 = Todo(
        id: '1',
        title: 'High priority task',
        createdAt: DateTime.now(),
        priority: Priority.high,
      );
      
      final todo2 = Todo(
        id: '2',
        title: 'Low priority task',
        createdAt: DateTime.now(),
        priority: Priority.low,
      );

      await provider.addTodo(todo1);
      await provider.addTodo(todo2);

      provider.setFilterPriority(Priority.high);

      expect(provider.todos.length, 1);
      expect(provider.todos.first.priority, Priority.high);
    });

    test('should filter completed todos only', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      final todo1 = Todo(
        id: '1',
        title: 'Completed task',
        createdAt: DateTime.now(),
        isCompleted: true,
      );
      
      final todo2 = Todo(
        id: '2',
        title: 'Pending task',
        createdAt: DateTime.now(),
        isCompleted: false,
      );

      await provider.addTodo(todo1);
      await provider.addTodo(todo2);

      provider.setShowCompletedOnly(true);

      expect(provider.todos.length, 1);
      expect(provider.todos.first.isCompleted, true);
    });

    test('should clear all todos', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        createdAt: DateTime.now(),
      );

      await provider.addTodo(todo);
      expect(provider.totalCount, 1);

      await provider.clearAllTodos();
      expect(provider.totalCount, 0);
      expect(provider.todos, isEmpty);
    });

    test('should delete completed todos only', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      final todo1 = Todo(
        id: '1',
        title: 'Completed task',
        createdAt: DateTime.now(),
        isCompleted: true,
      );
      
      final todo2 = Todo(
        id: '2',
        title: 'Pending task',
        createdAt: DateTime.now(),
        isCompleted: false,
      );

      await provider.addTodo(todo1);
      await provider.addTodo(todo2);
      expect(provider.totalCount, 2);

      await provider.deleteCompletedTodos();
      
      expect(provider.totalCount, 1);
      expect(provider.todos.first.isCompleted, false);
    });

    test('should clear filters', () async {
      final provider = TodoProvider();
      await Future.delayed(Duration.zero);
      
      provider.setSearchQuery('test');
      provider.setFilterPriority(Priority.high);
      provider.setShowCompletedOnly(true);

      expect(provider.searchQuery, 'test');
      expect(provider.filterPriority, Priority.high);
      expect(provider.showCompletedOnly, true);

      provider.clearFilters();

      expect(provider.searchQuery, '');
      expect(provider.filterPriority, null);
      expect(provider.showCompletedOnly, false);
    });
  });
}

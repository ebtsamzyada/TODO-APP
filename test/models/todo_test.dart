import 'package:flutter_test/flutter_test.dart';
import 'package:copilot_todo_demo/models/todo.dart';

void main() {
  group('Todo Model Tests', () {
    test('should create a todo with required fields', () {
      final now = DateTime.now();
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        createdAt: now,
      );

      expect(todo.id, '1');
      expect(todo.title, 'Test Todo');
      expect(todo.isCompleted, false);
      expect(todo.createdAt, now);
      expect(todo.priority, Priority.medium);
      expect(todo.description, null);
      expect(todo.completedAt, null);
      expect(todo.category, null);
    });

    test('should create a todo with all fields', () {
      final now = DateTime.now();
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: true,
        createdAt: now,
        completedAt: now,
        priority: Priority.high,
        category: 'Work',
      );

      expect(todo.id, '1');
      expect(todo.title, 'Test Todo');
      expect(todo.description, 'Test Description');
      expect(todo.isCompleted, true);
      expect(todo.createdAt, now);
      expect(todo.completedAt, now);
      expect(todo.priority, Priority.high);
      expect(todo.category, 'Work');
    });

    test('should copy todo with updated fields', () {
      final now = DateTime.now();
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        createdAt: now,
      );

      final updatedTodo = todo.copyWith(
        title: 'Updated Todo',
        isCompleted: true,
        completedAt: now,
      );

      expect(updatedTodo.id, '1');
      expect(updatedTodo.title, 'Updated Todo');
      expect(updatedTodo.isCompleted, true);
      expect(updatedTodo.completedAt, now);
      expect(updatedTodo.createdAt, now);
    });

    test('should serialize to JSON correctly', () {
      final now = DateTime.now();
      final todo = Todo(
        id: '1',
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: true,
        createdAt: now,
        completedAt: now,
        priority: Priority.high,
        category: 'Work',
      );

      final json = todo.toJson();

      expect(json['id'], '1');
      expect(json['title'], 'Test Todo');
      expect(json['description'], 'Test Description');
      expect(json['isCompleted'], true);
      expect(json['createdAt'], now.toIso8601String());
      expect(json['completedAt'], now.toIso8601String());
      expect(json['priority'], Priority.high.index);
      expect(json['category'], 'Work');
    });

    test('should deserialize from JSON correctly', () {
      final now = DateTime.now();
      final json = {
        'id': '1',
        'title': 'Test Todo',
        'description': 'Test Description',
        'isCompleted': true,
        'createdAt': now.toIso8601String(),
        'completedAt': now.toIso8601String(),
        'priority': Priority.high.index,
        'category': 'Work',
      };

      final todo = Todo.fromJson(json);

      expect(todo.id, '1');
      expect(todo.title, 'Test Todo');
      expect(todo.description, 'Test Description');
      expect(todo.isCompleted, true);
      expect(todo.createdAt.toIso8601String(), now.toIso8601String());
      expect(todo.completedAt?.toIso8601String(), now.toIso8601String());
      expect(todo.priority, Priority.high);
      expect(todo.category, 'Work');
    });
  });

  group('Priority Extension Tests', () {
    test('should return correct priority names', () {
      expect(Priority.low.name, 'Low');
      expect(Priority.medium.name, 'Medium');
      expect(Priority.high.name, 'High');
    });

    test('should return correct priority colors', () {
      expect(Priority.low.color, Colors.green);
      expect(Priority.medium.color, Colors.orange);
      expect(Priority.high.color, Colors.red);
    });
  });
}

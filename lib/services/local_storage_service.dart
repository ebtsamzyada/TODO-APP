import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:copilot_todo_demo/models/todo.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;
  static const String _todosKey = 'todos';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveTodos(List<Todo> todos) async {
    if (_prefs == null) await init();
    
    final todoJsonList = todos.map((todo) => todo.toJson()).toList();
    final todoJsonString = json.encode(todoJsonList);
    
    await _prefs!.setString(_todosKey, todoJsonString);
  }

  static Future<List<Todo>> getTodos() async {
    if (_prefs == null) await init();
    
    final todoJsonString = _prefs!.getString(_todosKey);
    if (todoJsonString == null) return [];
    
    final todoJsonList = json.decode(todoJsonString) as List<dynamic>;
    return todoJsonList.map((json) => Todo.fromJson(json)).toList();
  }

  static Future<void> clearTodos() async {
    if (_prefs == null) await init();
    await _prefs!.remove(_todosKey);
  }
}

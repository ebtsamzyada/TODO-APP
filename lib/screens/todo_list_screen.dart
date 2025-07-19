import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copilot_todo_demo/providers/todo_provider.dart';
import 'package:copilot_todo_demo/widgets/todo_list_item.dart';
import 'package:copilot_todo_demo/widgets/todo_stats.dart';
import 'package:copilot_todo_demo/widgets/search_bar.dart' as custom;
import 'package:copilot_todo_demo/widgets/filter_chips.dart';
import 'package:copilot_todo_demo/screens/add_todo_screen.dart';
import 'package:copilot_todo_demo/models/todo.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              final provider = Provider.of<TodoProvider>(context, listen: false);
              switch (value) {
                case 'clear_filters':
                  provider.clearFilters();
                  break;
                case 'delete_completed':
                  _showDeleteCompletedDialog(context, provider);
                  break;
                case 'clear_all':
                  _showClearAllDialog(context, provider);
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'clear_filters',
                child: Text('Clear Filters'),
              ),
              PopupMenuItem(
                value: 'delete_completed',
                child: Text('Delete Completed'),
              ),
              PopupMenuItem(
                value: 'clear_all',
                child: Text('Clear All'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          TodoStats(),
          custom.SearchBar(),
          FilterChips(),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, provider, child) {
                final todos = provider.todos;
                
                if (todos.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: 16),
                        Text(
                          provider.allTodos.isEmpty 
                              ? 'No todos yet!\nTap + to add your first task'
                              : 'No todos match your filters',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoListItem(todo: todos[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
    );
  }

  void _showDeleteCompletedDialog(BuildContext context, TodoProvider provider) {
    if (provider.completedCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No completed todos to delete')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Completed Todos'),
        content: Text('Are you sure you want to delete all completed todos? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.deleteCompletedTodos();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Completed todos deleted')),
              );
            },
            child: Text('Delete'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );
  }

  void _showClearAllDialog(BuildContext context, TodoProvider provider) {
    if (provider.totalCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No todos to clear')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear All Todos'),
        content: Text('Are you sure you want to delete all todos? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.clearAllTodos();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('All todos cleared')),
              );
            },
            child: Text('Clear All'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}

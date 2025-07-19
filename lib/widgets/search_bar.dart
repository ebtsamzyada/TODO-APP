import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copilot_todo_demo/providers/todo_provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = Provider.of<TodoProvider>(context, listen: false).searchQuery;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search todos...',
          prefixIcon: Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              Provider.of<TodoProvider>(context, listen: false)
            .setSearchQuery('');
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.blue.shade50, // Changed from grey.shade50 to blue.shade50
        ),
        onChanged: (value) {
          Provider.of<TodoProvider>(context, listen: false)
              .setSearchQuery(value);
          setState(() {}); // To show/hide clear button
        },
      ),


    );
  }
}

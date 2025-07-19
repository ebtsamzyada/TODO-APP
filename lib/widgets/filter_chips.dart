import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copilot_todo_demo/providers/todo_provider.dart';
import 'package:copilot_todo_demo/models/todo.dart';

class FilterChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 60,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                FilterChip(
                  label: Text('Show Completed Only'),
                  selected: provider.showCompletedOnly,
                  onSelected: (selected) {
                    provider.setShowCompletedOnly(selected);
                  },
                  avatar: Icon(
                    Icons.check_circle,
                    size: 18,
                    color: provider.showCompletedOnly ? Colors.white : Colors.grey,
                  ),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('High Priority'),
                  selected: provider.filterPriority == Priority.high,
                  onSelected: (selected) {
                    provider.setFilterPriority(
                      selected ? Priority.high : null,
                    );
                  },
                  avatar: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: provider.filterPriority == Priority.high
                          ? Colors.white
                          : Priority.high.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('Medium Priority'),
                  selected: provider.filterPriority == Priority.medium,
                  onSelected: (selected) {
                    provider.setFilterPriority(
                      selected ? Priority.medium : null,
                    );
                  },
                  avatar: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: provider.filterPriority == Priority.medium
                          ? Colors.white
                          : Priority.medium.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('Low Priority'),
                  selected: provider.filterPriority == Priority.low,
                  onSelected: (selected) {
                    provider.setFilterPriority(
                      selected ? Priority.low : null,
                    );
                  },
                  avatar: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: provider.filterPriority == Priority.low
                          ? Colors.white
                          : Priority.low.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                if (provider.searchQuery.isNotEmpty || 
                    provider.filterPriority != null || 
                    provider.showCompletedOnly)
                  ActionChip(
                    label: Text('Clear Filters'),
                    onPressed: () {
                      provider.clearFilters();
                    },
                    avatar: Icon(Icons.clear, size: 18),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

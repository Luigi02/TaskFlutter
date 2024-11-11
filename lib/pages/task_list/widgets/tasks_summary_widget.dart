import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';


class TasksSummaryWidget extends StatelessWidget {
  final TaskGroup taskGroup;
  final int completedTasks;
  final int totalTasks;

  const TasksSummaryWidget({
    super.key,
    required this.taskGroup,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: const AlwaysStoppedAnimation(Colors.red),
              backgroundColor: Colors.grey,
              value: totalTasks > 0 ? completedTasks / totalTasks : 0,
            ),
          ),
          const SizedBox(width: 20),

          /// Texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskGroup.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 3),
                Text(
                  "$completedTasks of $totalTasks tasks",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class TodoDardFilter extends StatefulWidget {
  const TodoDardFilter({Key? key}) : super(key: key);

  @override
  State<TodoDardFilter> createState() => _TodoDardFilterState();
}

class _TodoDardFilterState extends State<TodoDardFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 120.0,
        maxWidth: 150.0,
      ),
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(
          width: 1.0,
          color: Colors.grey.withOpacity(.8),
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10 TASKS',
            style: context.titleStyle.copyWith(
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
          const Text(
            'HOJE',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: context.primaryColorLight,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            value: 0.4,
          )
        ],
      ),
    );
  }
}

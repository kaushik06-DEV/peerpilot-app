import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Courses Coming Soon!',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

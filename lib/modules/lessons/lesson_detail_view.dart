import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/lesson_model.dart';

class LessonDetailView extends StatelessWidget {
  const LessonDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonModel lesson = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black.withOpacity(.08),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(lesson.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lesson.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed('/sessions', arguments: lesson),
              child: const Text("View Sessions"),
            ),
          ],
        ),
      ),
    );
  }
}

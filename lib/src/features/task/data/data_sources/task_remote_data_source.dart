import 'dart:developer';

import '../../../../core/utilits/services/api/dio_consumer.dart';
import '../../../../core/utilits/services/api/end_points.dart';
import '../models/task_model.dart';

class TaskRemoteDataSource {
  final DioConsumer dioConsumer;

  TaskRemoteDataSource({required this.dioConsumer});
  Future<List<Task?>> getTodos({required int page}) async {
    // ignore: unnecessary_cast
    final response = await dioConsumer.get("${EndPoints.todoList}?page=$page");

if (response is List) {
  return response
      .map((e) => e is Map<String, dynamic> ? Task.fromJson(e) : null)
      .where((e) => e != null)
      .toList();
} else {
  throw Exception('Unexpected response format');
}

  }

  createTask() {}

  editTask() {}
  deleteTask() {}
}

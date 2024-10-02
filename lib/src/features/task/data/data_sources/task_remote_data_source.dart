import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../../../core/utilits/services/api/dio_consumer.dart';
import '../../../../core/utilits/services/api/end_points.dart';
import '../models/add_task_model.dart';
import '../models/task_model.dart';

class TaskRemoteDataSource {
  final DioConsumer dioConsumer;

  TaskRemoteDataSource({required this.dioConsumer});
  Future<List<Task>> getTodos({required int page}) async {
    // ignore: unnecessary_cast
    final response = await dioConsumer.get("${EndPoints.todos}?page=$page");

    if (response is List) {
      return response
          .map(
            (e) => Task.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception('Unexpected response format');
    }
  }

  Future<Task> fetchOneTask(String id) async {
    final response = await dioConsumer.get("${EndPoints.todo}$id");
    return Task.fromJson(response);
  }

  Future<String> uploadImage(File image) async {
    String fileName = image.path.split('/').last;
    List<String> mimeType = lookupMimeType(image.path)!.split('/');

    Map<String, dynamic> body = {
      "image": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType(mimeType[0], mimeType[1]),
      ),
    };

    Map<String, dynamic> response = await dioConsumer
        .post(EndPoints.uploadImage, formDataIsEnabled: true, body: body);

    return response["image"];
  }

  Future<Task> createTask(AddTaskModel addTaskModel) async {
    Map<String, dynamic> response =
        await dioConsumer.post(EndPoints.todos, body: addTaskModel.toJson());

    return Task.fromJson(response);
  }

  Future<Task> editTask(Task task) async {
    Map<String, dynamic> response = await dioConsumer.put(EndPoints.todo + task.id,body: task.toJson());

    return Task.fromJson(response);
  }

  Future<Task> deleteTask(String id) async {
    Map<String, dynamic> response =
        await dioConsumer.delete(EndPoints.todo + id);

    return Task.fromJson(response);
  }
}

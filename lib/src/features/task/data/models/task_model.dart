import 'package:hive/hive.dart';

part 'task_model.g.dart'; // This is required for Hive to generate code

@HiveType(typeId: 0)
class Task  extends HiveObject{
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String desc;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final String priority;

  @HiveField(5)
  final String status;

  @HiveField(6)
  final String user;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  final DateTime updatedAt;

  Task({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.priority,
    required this.status,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });


  /// Factory method to create a `Todo` object from a JSON map.
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      image: json['image'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
      user: json['user'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Method to convert a `Todo` object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'desc': desc,
      'image': image,
      'priority': priority,
      'status': status,
      'user': user,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

// Run this command to generate the adapter file:
// flutter packages pub run build_runner build

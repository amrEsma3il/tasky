class ProfileModel {
  final String id;
  final String displayName;
  final String username;
  final List<String> roles;
  final bool active;
  final int experienceYears;
  final String address;
  final String level;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  ProfileModel({
    required this.id,
    required this.displayName,
    required this.username,
    required this.roles,
    required this.active,
    required this.experienceYears,
    required this.address,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  // Factory constructor to create ProfileModel from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'] as String,
      displayName: json['displayName'] as String,
      username: json['username'] as String,
      roles: List<String>.from(json['roles'] as List),
      active: json['active'] as bool,
      experienceYears: json['experienceYears'] as int,
      address: json['address'] as String,
      level: json['level'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: json['__v'] as int,
    );
  }

  // Method to convert ProfileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'displayName': displayName,
      'username': username,
      'roles': roles,
      'active': active,
      'experienceYears': experienceYears,
      'address': address,
      'level': level,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

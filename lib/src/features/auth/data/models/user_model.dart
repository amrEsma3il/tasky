class UserModel {
  final String phone;
  final String password;
  final String displayName;
  final int experienceYears;
  final String address;
  final String level;

  UserModel({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

  // Factory method to create an instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phone: json['phone'],
      password: json['password'],
      displayName: json['displayName'],
      experienceYears: json['experienceYears'],
      address: json['address'],
      level: json['level'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'displayName': displayName,
      'experienceYears': experienceYears,
      'address': address,
      'level': level,
    };
  }
}

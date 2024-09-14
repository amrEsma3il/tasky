class UserModel {
  String phone;
  String password;

  UserModel({
    required this.phone,
    required this.password,
  });

 factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phone: json['phone'],
      password: json['password'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }


 
}

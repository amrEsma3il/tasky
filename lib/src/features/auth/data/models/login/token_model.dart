class TokenModel {
  String id;
  String accessToken;
  String refreshToken;

  TokenModel({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });

   factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      id: json['_id'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

 
}

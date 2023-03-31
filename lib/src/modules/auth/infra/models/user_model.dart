import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? name,
    String? email,
    String? avatar,
    bool isAuthorized = false,
  }) : super(
          avatar: avatar,
          email: email,
          name: name,
          isAuthorized: isAuthorized,
        );

  factory UserModel.fromFacebookJson(dynamic json) {
    return UserModel(
      name: stringJson(json['name']),
      avatar: stringJson(json['picture']['data']['url']),
      email: stringJson(json['email']),
    );
  }

  static String? stringJson(dynamic value) {
    return value?.toString();
  }
}

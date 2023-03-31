class UserEntity {
  String? name;
  String? email;
  String? avatar;
  bool isAuthorized;
  UserEntity({
    this.name,
    this.email,
    this.avatar,
    this.isAuthorized = false,
  });
}

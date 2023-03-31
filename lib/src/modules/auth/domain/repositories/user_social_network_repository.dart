import '../entities/user_entity.dart';

abstract class UserSocialNetworkRepository {
  Future<UserEntity>? getUserSocialNetwork({required String socialNetwork});
}

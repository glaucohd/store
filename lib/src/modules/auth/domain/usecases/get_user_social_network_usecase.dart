import '../entities/user_entity.dart';

abstract class GetUserSocialNetworkUsecase {
  Future<UserEntity>? call({required String socialNetwork});
}

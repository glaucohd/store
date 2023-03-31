import '../entities/user_entity.dart';
import '../repositories/user_social_network_repository.dart';
import 'get_user_social_network_usecase.dart';

class GetUserSocialNetworkUsecaseImpl implements GetUserSocialNetworkUsecase {
  final UserSocialNetworkRepository repository;

  GetUserSocialNetworkUsecaseImpl({required this.repository});

  @override
  Future<UserEntity>? call({required String socialNetwork}) {
    return repository.getUserSocialNetwork(socialNetwork: socialNetwork);
  }
}

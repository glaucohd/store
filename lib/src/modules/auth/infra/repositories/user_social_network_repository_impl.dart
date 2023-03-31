import 'package:store/src/modules/auth/domain/entities/user_entity.dart';

import '../../domain/repositories/user_social_network_repository.dart';
import '../datasources/user_social_network_datasource.dart';

class UserSocialNetworkRepositoryImpl implements UserSocialNetworkRepository {
  final UserSocialNetworkDatasources datasources;

  UserSocialNetworkRepositoryImpl({required this.datasources});

  @override
  Future<UserEntity>? getUserSocialNetwork({required String socialNetwork}) {
    return datasources.getUserSocialNetwork(socialNetwork: socialNetwork);
  }
}

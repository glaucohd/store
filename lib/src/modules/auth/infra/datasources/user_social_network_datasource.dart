import '../models/user_model.dart';

abstract class UserSocialNetworkDatasources {
  Future<UserModel>? getUserSocialNetwork({required String socialNetwork});
}

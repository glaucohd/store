import 'package:google_sign_in/google_sign_in.dart';
import 'package:store/src/modules/auth/infra/models/user_model.dart';

import '../../infra/datasources/user_social_network_datasource.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserSocialNetworkDatasourcesImpl implements UserSocialNetworkDatasources {
  @override
  Future<UserModel>? getUserSocialNetwork({
    required String socialNetwork,
  }) async {
    UserModel? userModel = UserModel();
    const facebook = "facebook";
    const google = "google";

    switch (socialNetwork) {
      case facebook:
        userModel = await signInWithFacebook();
        break;
      case google:
        userModel = await signInWithGoogle();
        break;
      default:
    }

    return userModel ?? UserModel();
  }

  //AUTENCTICAÇÃO COM FACEBOOK
  Future<UserModel>? signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    UserModel? userData = UserModel();

    if (result.status == LoginStatus.success) {
      final json = await FacebookAuth.instance.getUserData();
      userData = UserModel.fromFacebookJson(json);
      userData.isAuthorized = true;

      return userData;
    }

    return userData;
  }

  //AUTENCTICAÇÃO COM GOOGLE
  Future<UserModel>? signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final result = await googleSignIn.signIn();

    UserModel? userData = UserModel();

    if (result != null) {
      userData = UserModel(
        avatar: result.photoUrl,
        email: result.email,
        name: result.displayName,
        isAuthorized: true,
      );

      return userData;
    }

    return userData;
  }
}

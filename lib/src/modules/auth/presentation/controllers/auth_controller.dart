import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/navigator_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_user_social_network_usecase_impl.dart';
import '../vos/user_vo.dart';

class AuthController extends ChangeNotifier {
  final GetUserSocialNetworkUsecaseImpl usecase;
  UserVO infoUser = UserVO();
  String socialNetwork = "";

  AuthController({required this.usecase});

  //AUTENCTICAÇÃO COM FACEBOOK
  Future<bool> signInWithFacebook() async {
    bool isAuthorized = false;
    socialNetwork = "facebook";

    final result = await usecase(socialNetwork: socialNetwork);

    if (result?.isAuthorized == true) {
      isAuthorized = result!.isAuthorized;
      notifyListeners();
      setDataInfoUser(result: result);
      return isAuthorized;
    }

    return isAuthorized;
  }

  Future<bool> signInWithGoogle() async {
    bool isAuthorized = false;
    socialNetwork = "google";

    final result = await usecase(socialNetwork: socialNetwork);

    if (result?.isAuthorized == true) {
      isAuthorized = result!.isAuthorized;
      notifyListeners();
      setDataInfoUser(result: result);

      return isAuthorized;
    }

    return isAuthorized;
  }

  void setDataInfoUser({required UserEntity? result}) {
    infoUser = UserVO(
      avatar: result?.avatar,
      email: result?.email,
      name: result?.name,
    );
    notifyListeners();
  }

  Future<void> logout() async {
    switch (socialNetwork) {
      case "facebook":
        await FacebookAuth.instance.logOut();
        navigateTo(route: "/");
        break;
      case "google":
        final GoogleSignIn googleSignIn = GoogleSignIn();
        await googleSignIn.signOut();
        navigateTo(route: "/");
        break;
      default:
    }
  }

  void navigateTo({required String route}) {
    NavigatorService.instance.key.currentState
        ?.pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  void popToPage() {
    NavigatorService.instance.key.currentState?.pop();
  }
}

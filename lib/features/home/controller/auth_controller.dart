import 'package:cinsie_neonimals/api/models/subscriber_model.dart';
import 'package:cinsie_neonimals/api/user_api.dart';
import 'package:cinsie_neonimals/constants/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    userAPI: ref.watch(userAPIProvider),
  );
});

class AuthController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  AuthController({
    required UserAPI userAPI,
  })  : _userAPI = userAPI,
        super(false);

  void subscribe({
    required String email,
    required BuildContext context,
  }) async {
    Subscriber userModel = Subscriber(
      email: email,
    );
    final res2 = await _userAPI.saveEmailSubscriber(userModel);
    res2.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'You are now signed up: $email');
      },
    );
  }
}

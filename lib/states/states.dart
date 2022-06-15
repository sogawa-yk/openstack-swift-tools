//import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:openstack_swift_gui/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openstack_swift_gui/models/user.dart';
import 'package:openstack_swift_gui/controller/swift_api.dart';

// class UserStateNotifier extends StateNotifier<User> {
//   UserStateNotifier() : super(User('', ''));
//   var file_list = [];
//   late User user_info;

//   void set_user_info(String id, String pw) {
//     user_info = User(id, pw);
//   }

//   Future<String?> get_auth_token() {
//     return user_info.auth_token.then((value) => value);
//   }

// }

final UserProvider = FutureProvider.family<String?, User>((ref, User) async {
  return await authentication(User.id, User.pw);
});

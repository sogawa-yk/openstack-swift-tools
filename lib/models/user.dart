import 'package:openstack_swift_gui/controller/swift_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

// class User {
//   String id = '';
//   String pw = '';
//   late Future<String?> auth_token; // nullSafetyのため、auth_tokenも必ず初期化する必要がある。
//   // authenticationはコンストラクタで呼び出すので、この段階では初期化できないので、late修飾子で後で初期化することをdartに伝える。

//   User(String id, String pw) {
//     this.id = id;
//     this.pw = pw;
//   } // コンストラクタ（初期化時に実行）

//   Future<String?> get_file_list() {
//     final result =
//         showListObjects((this.auth_token.then((value) => value)).toString())
//             .then((value) => value);

//     return result;
//   }
// }

@freezed
abstract class User with _$User {
  const factory User({required String id, required String pw}) = _User;
}

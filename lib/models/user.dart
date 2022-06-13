import 'package:openstack_swift_gui/controller/swift_api.dart';

class User {
  String id = "";
  String pw = "";
  late Future<String> auth_token; // nullSafetyのため、auth_tokenも必ず初期化する必要がある。
  // authenticationはコンストラクタで呼び出すので、この段階では初期化できないので、late修飾子で後で初期化することをdartに伝える。

  User(String id, String pw) {
    this.id = id;
    this.pw = pw;
    this.auth_token = authentication(id, pw);
  } // コンストラクタ（初期化時に実行）

}

void main() {
  var u = User('sogawa', 'link3263');
  u.auth_token.then(((value) => print(value)));
}

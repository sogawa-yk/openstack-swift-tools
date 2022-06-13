import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> authentication(String id, String pw) async {
  const url = 'http://192.168.2.10:5000/v3/auth/tokens';
  const header = {'Content-Type': 'application/json'};
  final body = {
    'auth': {
      'identity': {
        'methods': ['password'],
        'password': {
          'user': {
            'name': id,
            'password': pw, // 後で入れる（githubに上げるから消した）
            'domain': {'name': 'Default'}
          }
        }
      },
      'scope': {
        'project': {
          'name': 'DCOS',
          'domain': {'name': 'Default'}
        }
      }
    }
  };

  var response =
      await http.post(Uri.parse(url), body: json.encode(body), headers: header);

  String token = '';

  if (response.statusCode == 201) {
    Map<String, String> header = response.headers;
    var token = header['x-subject-token'];
  } else {
    print(response.statusCode);
  }

  return token;
}

void main() {
  var token = authentication('sogawa', 'link3263');
  print(token);
}

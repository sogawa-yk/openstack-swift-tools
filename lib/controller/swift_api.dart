import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> authentication(String id, String pw) async {
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

  print('ID: ${id}, PW: ${pw}');

  var response =
      await http.post(Uri.parse(url), body: json.encode(body), headers: header);

  if (response.statusCode == 201) {
    Map<String, String> header = response.headers;
    return header['x-subject-token'];
  } else {
    print(response.statusCode);
  }
}

// void main() {
//   var token = authentication('sogawa', 'link3263');
//   print(token.toString());
// }

Future<String> showListObjects(String token) async {
  const url =
      'http://192.168.2.10:8080/v1/AUTH_1c1000fd2fc04cb2831a5e163e8802ea/test?format=json';
  final header = {'X-Auth-Token': token};

  var response = await http.get(Uri.parse(url), headers: header);

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = json.decode(response.body);
    print(decodedJson['name']);
    return decodedJson['name'];
  } else {
    print(response.statusCode);
    return 
  }
}

//import 'dart:html';

// TODO
// dartにおけるWebAPIのたたき方を勉強する
// なんかクラス作って、fromJsonみたいなことしてるやつが多い
// 現状、なんとか認証トークンは発行できたが、発行する関数から受け取った値をほかの操作の関数に渡せない（String以外が入る可能性があるから無理とか言われる）
// APIの正しいたたき方を学ばないと無理そう

import 'package:flutter/material.dart';
import 'package:openstack_swift_gui/login.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ダミー表示用のファイルリスト
// SwiftのAPIによって取得する予定

Future<String> _auth() async {
  const url = 'http://192.168.2.10:5000/v3/auth/tokens';
  const header = {'Content-Type': 'application/json'};
  const body = {
    'auth': {
      'identity': {
        'methods': ['password'],
        'password': {
          'user': {
            'name': 'sogawa',
            'password': '', // 後で入れる（githubに上げるから消した）
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

Future<String> _showListObjects(String token) async {
  const url =
      'http://192.168.2.10:8080/v1/AUTH_1c1000fd2fc04cb2831a5e163e8802ea/test?format=json';
  final header = {'X-Auth-Token': token};
  // const params = {'format': 'json'};

  var response = await http.get(Uri.parse(url), headers: header);

  if (response.statusCode == 200) {
    Map<String, dynamic> decodedJson = json.decode(response.body);
    print(decodedJson['name']);
  } else {
    print(response.statusCode);
  }

  return token;
}

List _make_file_list() {
  const sample1 = [
    'sample1.txt',
    'sample2.csv',
    'sample3.iso',
    'sample4.jpg',
    'sample5.png',
    'sample6.py'
  ];
  const sample2 = ['neko.txt', 'inu.csv', 'cat.py', 'dog.c', 'koneko.out'];
  const sample3 = [
    'chibisuke.txt',
    'sasupenda-kun.py',
    'sibainu.c',
    'kosokososan.out'
  ];

  const samples = [sample1, sample2, sample3];
  final int index = Random().nextInt(3);
  return samples[index];
}

class FileView extends StatefulWidget {
  const FileView({Key? key}) : super(key: key);

  @override
  _FileViewState createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  var file_list =
      List.from(_make_file_list()); // toList() or List.from()しないと破壊的変更（削除）ができない

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenStack Swift GUI Tool'),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: file_list.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                        title: Text(file_list[index]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FileView()));
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _showListObjects('gAAAAABipflyP_hnZ3G_MxQ3CxV5wBgR_k6FuulDc4AqpuCIi7hyRgLT_WpJ2DF9bnwyG4bL6Gb56fnFIj_v1O0_PkLAPESbKmntAacIjs2XNUi9UpO-fIbByD-OGLWjZ8RCtC7bi1T9dpvNqHJJUnToXFieh21pGK6PldJgvKH5Oov6UaHNOwI');
                              file_list.removeAt(index);
                            });
                          },
                        )));
              })),
    );
  }
}

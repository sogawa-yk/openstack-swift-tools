import 'dart:html';

import 'package:flutter/material.dart';
import 'package:openstack_swift_gui/login.dart';
import 'dart:math';

// ダミー表示用のファイルリスト
// SwiftのAPIによって取得する予定

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
  var file_list = List.from(_make_file_list()); // toList() or List.from()しないと破壊的変更（削除）ができない

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
                              file_list.removeAt(index);
                            });
                          },
                        )));
              })),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:openstack_swift_gui/login.dart';


// ダミー表示用のファイルリスト
// SwiftのAPIによって取得する予定
var file_list = [
  'sample1.txt',
  'sample2.csv',
  'sample3.iso',
  'sample4.jpg',
  'sample5.png',
  'sample6.py'
];


class FileView extends StatelessWidget {
  const FileView({Key? key}) : super(key: key);

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
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {},
                        )));
              })),
    );
  }
}
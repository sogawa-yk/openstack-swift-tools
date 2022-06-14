//import 'dart:html';

// TODO
// dartにおけるWebAPIのたたき方を勉強する
// なんかクラス作って、fromJsonみたいなことしてるやつが多い
// 現状、なんとか認証トークンは発行できたが、発行する関数から受け取った値をほかの操作の関数に渡せない（String以外が入る可能性があるから無理とか言われる）
// APIの正しいたたき方を学ばないと無理そう

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openstack_swift_gui/main.dart';
import 'package:provider/provider.dart';
import 'package:openstack_swift_gui/states/states.dart';

// ダミー表示用のファイルリスト
// SwiftのAPIによって取得する予定

class FileList extends ConsumerWidget {
  const FileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStateMethods = ref.read(userProvider.notifier);
    userStateMethods.get_auth_token().then((value) => print(value));
    return Text('TEST');
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('OpenStack Swift GUI Tool'),
    //   ),
    //   body: Center(
    //       child: ListView.builder(
    //           itemCount: file_list.length,
    //           itemBuilder: (context, index) {
    //             return Card(
    //                 child: ListTile(
    //                     title: Text(file_list[index]),
    //                     onTap: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (context) => FileView()));
    //                     },
    //                     trailing: IconButton(
    //                       icon: const Icon(Icons.delete),
    //                       onPressed: () {
    //                         setState(() {
    //                           _showListObjects(
    //                               'gAAAAABipflyP_hnZ3G_MxQ3CxV5wBgR_k6FuulDc4AqpuCIi7hyRgLT_WpJ2DF9bnwyG4bL6Gb56fnFIj_v1O0_PkLAPESbKmntAacIjs2XNUi9UpO-fIbByD-OGLWjZ8RCtC7bi1T9dpvNqHJJUnToXFieh21pGK6PldJgvKH5Oov6UaHNOwI');
    //                           file_list.removeAt(index);
    //                         });
    //                       },
    //                     )));
    //           })),
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:openstack_swift_gui/view/login_page.dart';
import 'package:openstack_swift_gui/states/states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider((ref) => UserStateNotifier());

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'OpenStack Swift GUI Tool';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: LoginPage(),
      ),
    );
  }
}

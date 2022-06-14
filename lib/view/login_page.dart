import 'package:flutter/material.dart';
import 'package:openstack_swift_gui/main.dart';
import 'package:openstack_swift_gui/view/filelist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openstack_swift_gui/states/states.dart';

class LoginPage extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _login_id = '';
  String _login_pw = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStateMethods = ref.read(userProvider.notifier);
    return Form(
        key: _formKey,
        child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your ID',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    _login_id = value;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    _login_pw = value;
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                          userStateMethods.set_user_info(_login_id, _login_pw);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FileList()));
                        }
                      },
                      child: const Text('Submit'),
                    ))
              ],
            )));
  }
}

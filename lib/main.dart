import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'screen/profile_page.dart';
import 'screen/sign_in_page.dart';
void main() {
  runApp(const MyApp());
}


Map<String, Widget> _components = {
  '/': const _HomePage(),
  'profile_page': const ProfilePage(),
  'sign_in_page': const SignInPage2(),
};
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      routes:
      _components.map((key, value) => MapEntry(key, (context) => value)),
    );
  }
}
class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _components.length,
              itemBuilder: (BuildContext context, int index) {
                final String routeName = _components.keys.elementAt(index);
                Map<String, String> namePage = {
                  "Home": "",
                  "Profile": "",
                  "Sign In": "",
                };
                return ListTile(
                    title: Text(namePage.keys.elementAt(index)),
                    onTap: () {
                      Navigator.pushNamed(context, routeName);
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
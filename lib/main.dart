import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/map_screen.dart';
import './model/picture_list.dart';
import './screens/login_screen.dart';
import 'model/authentication_service.dart';
// import './screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null,
          )
        ],
        child: MaterialApp(
          title: 'AEP Smart Reports',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            canvasColor: Colors.white,
          ),
          // home: const MyHomePage(title: 'AEP Smart Reports'),
          home: const AuthenticationWrapper(),
        ));
  }
}

// decides which screen to show based on authentication process
class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    return firebaseUser != null ? const MapScreen() : LoginScreen();
  }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Firebase.initializeApp(),
//         builder: (context, snapshot) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 widget.title,
//                 style: const TextStyle(color: Colors.black),
//               ),
//               backgroundColor: Colors.white,
//               elevation: 0,
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => MapScreen()));
//                     },
//                     child: const Text('Open Map'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
}

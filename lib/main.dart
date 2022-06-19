import 'package:flutter/material.dart';
import 'package:login/Login.dart';
import 'package:login/headers.dart';
import 'package:login/registro.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login app',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderCurvo2(),
          HeaderCurvo(),
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 200, right: 20, bottom: 30),
                child: Icon(Icons.account_circle, size: 200, color: Colors.white)
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, top: 40, right: 10),
                      child: Center(  
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:  const Color.fromARGB(255, 118, 48, 247),
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 15),),
                          onPressed: () {
                            print('Entrar');
                            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40, right: 50),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:  const Color.fromARGB(255, 118, 48, 247),
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: const Text('Registrarse', style: TextStyle(fontSize: 15),),
                          onPressed: () {
                            print('Registrarse');
                            Navigator.push(context, MaterialPageRoute(builder: (_) => Registro()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

import 'headers.dart';
// import 'package:flutter_string_encryption/flutter_string_encryption.dart';

class Registro extends StatefulWidget {
   
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  
  TextEditingController usuario = TextEditingController();
  TextEditingController documento = TextEditingController();
  TextEditingController password = TextEditingController();
  var encryp;


  final firebase =  FirebaseFirestore.instance;

  registroUsuario() async {
    try {
      await firebase.collection('Users').doc().set(
        {
          'nombre' : usuario.text,
          'documento' : documento.text,
          'password' : encryp.toString(),
        }
      );
    } catch (e) {
      print('ERROR....' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Usuario'),
      ),
      body: Stack(
        children: [
          HeaderCurvo2(),
          HeaderCurvo(),
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 30),
                child: Icon(Icons.account_box_outlined, size: 200, color: Colors.white)
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: TextField(
                  controller: usuario,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.mail, color: Colors.white),
                    labelText: 'Nombre Usuario',
                    hintText: 'Digite el nombre de usuario',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  controller: documento,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.assignment_ind_outlined, color: Colors.white,),
                    labelText: 'Número de Documento',
                    hintText: 'Digite el número del documento',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.password, color: Colors.white,),
                    labelText: 'Contraseña Usuario',
                    hintText: 'Digite la contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 40, right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:  const Color.fromARGB(255, 118, 48, 247),
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    Encrypt();
                    registroUsuario();
                    usuario.clear();
                    documento.clear();
                    password.clear();
                    print('Enviado');
                    print(usuario.text);
                    print(documento.text);
                    print(password.text);
                  },
                  child: Text('Registrarse'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void Encrypt() async {
    var key = utf8.encode('p@ssw0rd');
    var bytes = utf8.encode(password.text);
  
    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
  
    encryp = hmacSha256.convert(utf8.encode(digest.toString()));
  
    print("HMAC digest as hex string: $encryp");
  }


}
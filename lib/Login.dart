import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/bienvenido.dart';

import 'headers.dart';

class Login extends StatefulWidget {
   
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  var encryp;

  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      var userValido = false;

      if(usuario.docs.length != 0){
        for(var cursor in usuario.docs){
          if(cursor.get('nombre') == user.text) {
            if(cursor.get('password') == encryp.toString()){
              userValido = true;
              print('Usuario Encontrado');
              Navigator.push(context, MaterialPageRoute(builder: (_) => BienvenidoScreen()));
              break;
            } else {
              print('Contraseña no encontrada');
              userValido = false;
            }
          }else{
            print('Usuario no encontrado');
            userValido = false;
          }
        }
      }else {
        print('No hay documentos en la coleccion');
      }

      if(!userValido){
        print('Alert');
        _alertDialog();
      }

    }catch (e) {
      print( 'ERROR...' + e.toString());
    }
      
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          HeaderCurvo2(),
          HeaderCurvo(),
          ListView(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 30),
                    child: Icon(Icons.account_box_outlined, size: 200, color: Colors.white)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: user,
                      style: const TextStyle(
                        //backgroundColor: Colors.white,
                      ),
                      decoration: InputDecoration(
                        iconColor: Colors.white,
                        icon: const Icon(Icons.mail, color: Colors.white,),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Usuario',
                        hintText: 'Digite su usuario',
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        icon: const Icon(Icons.password, color: Colors.white,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Contraseña',
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Digite su contraseña',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40, right: 10),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:  const Color.fromARGB(255, 118, 48, 247),
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text('Ingresar'),
                        onPressed: () {
                          Encrypt();
                          print('Ingresando');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]
      ),
    );
  }

  void _alertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext){
        return AlertDialog(
          title: const Text('Error', style: TextStyle(color: Colors.red)),
          content: const Text('Usuario o Contraseña Incorrectos'),
          actions: <Widget>[
            const Icon(Icons.error_outline, color: Colors.red,),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aceptar')),
          ],
        );
      }
    );
  }

  void Encrypt() async{
    var key = utf8.encode('p@ssw0rd');
    var bytes = utf8.encode(password.text);
  
    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
  
    encryp = hmacSha256.convert(utf8.encode(digest.toString()));
  
    print("HMAC digest as hex string: " + encryp.toString());

    validarDatos();
  }
  
}
import 'package:flutter/material.dart';
import 'package:login/headers.dart';

class BienvenidoScreen extends StatelessWidget {
  const BienvenidoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: Stack(
        children: [
          HeaderCurvo2(),
          HeaderCurvo(),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.cyan[800],
                  size: 150,
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 2),
                child: Center(child: 
                  Text(
                    'BIENVENIDO', 
                    style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.cyan[800]
                    )
                  )
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

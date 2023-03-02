import 'package:flutter/material.dart';
import 'tasks.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO APP'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Usuario',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                const TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: 'Ingrese su usuario',
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none)),
                const Text('Contraseña',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Ingrese su contraseña',
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Tasks(),
                        ));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Ingresar',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

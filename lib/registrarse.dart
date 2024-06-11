// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart'; // Asegúrate de tener una clase MyLoginPage en login.dart

class Registro extends StatefulWidget {
  final Future<void> Function() onRegister; // Añade esta línea

  // ignore: use_super_parameters
  const Registro({Key? key, required this.onRegister}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

// ignore: unused_element
void _onRegister(BuildContext context) async {
  try {
    print("Registro completado");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyLoginPage()),
    );
  } catch (e) {
    print("Error al registrar: $e");
  }
}

class _RegistroState extends State<Registro> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _correoController.text,
        password: _contrasenaController.text,
      );
      await widget.onRegister(); // Llama al callback `onRegister`
      // Si el registro es exitoso, navega a la pantalla principal
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
      );
    } catch (e) {
      // Manejo de errores
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: const Color.fromARGB(255, 0, 25, 213),
              ),
            ),
          ),
          Positioned(
            bottom: -250,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: Clipperinf(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: const Color.fromARGB(255, 51, 47, 238),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(35.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 72, 72, 72)
                            .withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 50),
                      const Text(
                        'Registrarse',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Ingrese su información',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        controller: _usuarioController,
                        style: const TextStyle(fontSize: 14.0),
                        decoration: const InputDecoration(
                          labelText: 'Usuario',
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _correoController,
                        style: const TextStyle(fontSize: 14.0),
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: Icon(Icons.email_rounded),
                          labelStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _contrasenaController,
                        style: const TextStyle(fontSize: 14.0),
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _register,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 12, 12, 219)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 360;
    final double yScaling = size.height / 350;
    path.lineTo(0 * xScaling, 0 * yScaling);
    path.cubicTo(
      0 * xScaling,
      0 * yScaling,
      360 * xScaling,
      0 * yScaling,
      360 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      360 * xScaling,
      0 * yScaling,
      360 * xScaling,
      142 * yScaling,
      360 * xScaling,
      142 * yScaling,
    );
    path.cubicTo(
      360 * xScaling,
      153.046 * yScaling,
      351.046 * xScaling,
      162 * yScaling,
      340 * xScaling,
      162 * yScaling,
    );
    path.cubicTo(
      340 * xScaling,
      162 * yScaling,
      20 * xScaling,
      162 * yScaling,
      20 * xScaling,
      162 * yScaling,
    );
    path.cubicTo(
      8.95432 * xScaling,
      162 * yScaling,
      0 * xScaling,
      153.046 * yScaling,
      0 * xScaling,
      142 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      142 * yScaling,
      0 * xScaling,
      0 * yScaling,
      0 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      0 * yScaling,
      0 * xScaling,
      0 * yScaling,
      0 * xScaling,
      0 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Clipperinf extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 360;
    final double yScaling = size.height / 450;
    path.lineTo(0.778 * xScaling, 34.459 * yScaling);
    path.cubicTo(
      72.278 * xScaling,
      160.959 * yScaling,
      360.778 * xScaling,
      34.459 * yScaling,
      360.778 * xScaling,
      34.459 * yScaling,
    );
    path.cubicTo(
      360.778 * xScaling,
      34.459 * yScaling,
      360.778 * xScaling,
      170.459 * yScaling,
      360.778 * xScaling,
      170.459 * yScaling,
    );
    path.cubicTo(
      360.778 * xScaling,
      170.459 * yScaling,
      0.778 * xScaling,
      170.459 * yScaling,
      0.778 * xScaling,
      170.459 * yScaling,
    );
    path.cubicTo(
      0.778 * xScaling,
      170.459 * yScaling,
      -70.722 * xScaling,
      -92.041 * yScaling,
      0.778 * xScaling,
      34.459 * yScaling,
    );
    path.cubicTo(
      0.778 * xScaling,
      34.459 * yScaling,
      0.778 * xScaling,
      34.459 * yScaling,
      0.778 * xScaling,
      34.459 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

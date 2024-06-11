import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'olvidastecontra.dart';
import 'registrarse.dart';
import 'inicioprincipal.dart';

class MyLoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _signIn() async {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Iniciar sesión exitoso, realizar navegación a la pantalla principal u otra pantalla
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => VentanaPrincipal()),
        );
      } catch (e) {
        // Error en el inicio de sesión, mostrar mensaje de error al usuario
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al iniciar sesión: ${e.toString()}')),
        );
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: const Color.fromARGB(255, 51, 47, 238),
            ),
          ),
          Transform.translate(
            offset: const Offset(0.0, 350.00),
            child: ClipPath(
              clipper: MySecondClipper(),
              child: Container(
                color: const Color.fromARGB(255, 51, 47, 238),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 150.0),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Column(
                    children: [
                      Text(
                        'MG',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 47, 238),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 32.0,
                        ),
                      ),
                      Text(
                        'TECNOLOGY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 47, 238),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 32.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.8),
                  const Text(
                    'Ingrese credenciales para continuar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Correo o usuario',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PasswordReset()));
                    },
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 36, 0, 240),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: _signIn,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 27, 0, 203),
                      ),
                    ),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('¿No tienes una cuenta?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Registro(onRegister: () async {}),
                            ),
                          );
                        },
                        child: const Text(
                          'Regístrate',
                          style:
                              TextStyle(color: Color.fromARGB(255, 7, 15, 255)),
                        ),
                      ),
                    ],
                  ),
                ],
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
    // ignore: no_leading_underscores_for_local_identifiers
    final double _xScaling = size.width / 350;
    // ignore: no_leading_underscores_for_local_identifiers
    final double _yScaling = size.height / 500;
    path.lineTo(-1 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      -1 * _xScaling,
      0 * _yScaling,
      376.449 * _xScaling,
      0 * _yScaling,
      376.449 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      376.449 * _xScaling,
      0 * _yScaling,
      451.939 * _xScaling,
      216.453 * _yScaling,
      376.449 * _xScaling,
      81.9579 * _yScaling,
    );
    path.cubicTo(
      300.959 * _xScaling,
      -52.5371 * _yScaling,
      -1 * _xScaling,
      124.688 * _yScaling,
      -1 * _xScaling,
      124.688 * _yScaling,
    );
    path.cubicTo(
      -1 * _xScaling,
      124.688 * _yScaling,
      -1 * _xScaling,
      0 * _yScaling,
      -1 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -1 * _xScaling,
      0 * _yScaling,
      -1 * _xScaling,
      0 * _yScaling,
      -1 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MySecondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // ignore: no_leading_underscores_for_local_identifiers
    final double _xScaling = size.width / 350;
    // ignore: no_leading_underscores_for_local_identifiers
    final double _yScaling = size.height / 500;
    path.lineTo(-67.7236 * _xScaling, 248.032 * _yScaling);
    path.cubicTo(
      -238.259 * _xScaling,
      192.906 * _yScaling,
      419.892 * _xScaling,
      280.357 * _yScaling,
      381.368 * _xScaling,
      62.1629 * _yScaling,
    );
    path.cubicTo(
      342.845 * _xScaling,
      -156.032 * _yScaling,
      371.382 * _xScaling,
      270.26 * _yScaling,
      371.382 * _xScaling,
      270.26 * _yScaling,
    );
    path.cubicTo(
      371.382 * _xScaling,
      270.26 * _yScaling,
      11.3085 * _xScaling,
      270.26 * _yScaling,
      11.3085 * _xScaling,
      270.26 * _yScaling,
    );
    path.cubicTo(
      11.3085 * _xScaling,
      270.26 * _yScaling,
      102.811 * _xScaling,
      303.158 * _yScaling,
      -67.7236 * _xScaling,
      248.032 * _yScaling,
    );
    path.cubicTo(
      -67.7236 * _xScaling,
      248.032 * _yScaling,
      -67.7236 * _xScaling,
      248.032 * _yScaling,
      -67.7236 * _xScaling,
      248.032 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

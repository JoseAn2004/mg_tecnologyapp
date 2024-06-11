import 'package:flutter/material.dart';

class CambioContrasena extends StatefulWidget {
  const CambioContrasena({Key? key}) : super(key: key);

  @override
  _CambioContrasenaState createState() => _CambioContrasenaState();
}

class _CambioContrasenaState extends State<CambioContrasena> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordsMatch = true;

  void _validatePasswords() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text;
    });
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
                color: Color.fromARGB(255, 0, 25, 213),
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
                color: Color.fromARGB(255, 51, 47, 238),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(35.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 72, 72, 72).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        'Cambiar Contraseña',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/password_image.png',
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Ingrese su nueva contraseña',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'y confirme la contraseña',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 30),
                      _buildPasswordField(
                        _passwordController,
                        "Nueva Contraseña",
                      ),
                      SizedBox(height: 20),
                      _buildPasswordField(
                        _confirmPasswordController,
                        "Confirmar Contraseña",
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          _validatePasswords();
                          if (_passwordsMatch) {
                            // Acción al presionar el botón de cambiar contraseña
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 12, 12, 219)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Cambiar Contraseña',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
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

  Widget _buildPasswordField(TextEditingController controller, String label) {
    bool _isPasswordVisible = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return TextField(
          controller: controller,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _passwordsMatch ? Colors.green : Colors.red,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _passwordsMatch ? Colors.green : Colors.red,
                width: 2.0,
              ),
            ),
          ),
          onChanged: (value) {
            _validatePasswords();
          },
        );
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 360;
    final double _yScaling = size.height / 350;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      360 * _xScaling,
      0 * _yScaling,
      360 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      360 * _xScaling,
      0 * _yScaling,
      360 * _xScaling,
      142 * _yScaling,
      360 * _xScaling,
      142 * _yScaling,
    );
    path.cubicTo(
      360 * _xScaling,
      153.046 * _yScaling,
      351.046 * _xScaling,
      162 * _yScaling,
      340 * _xScaling,
      162 * _yScaling,
    );
    path.cubicTo(
      340 * _xScaling,
      162 * _yScaling,
      20 * _xScaling,
      162 * _yScaling,
      20 * _xScaling,
      162 * _yScaling,
    );
    path.cubicTo(
      8.95432 * _xScaling,
      162 * _yScaling,
      0 * _xScaling,
      153.046 * _yScaling,
      0 * _xScaling,
      142 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      142 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
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
    final double _xScaling = size.width / 360;
    final double _yScaling = size.height / 450;
    path.lineTo(0.778 * _xScaling, 34.459 * _yScaling);
    path.cubicTo(
      72.278 * _xScaling,
      160.959 * _yScaling,
      360.778 * _xScaling,
      34.459 * _yScaling,
      360.778 * _xScaling,
      34.459 * _yScaling,
    );
    path.cubicTo(
      360.778 * _xScaling,
      34.459 * _yScaling,
      360.778 * _xScaling,
      170.459 * _yScaling,
      360.778 * _xScaling,
      170.459 * _yScaling,
    );
    path.cubicTo(
      360.778 * _xScaling,
      170.459 * _yScaling,
      0.778 * _xScaling,
      170.459 * _yScaling,
      0.778 * _xScaling,
      170.459 * _yScaling,
    );
    path.cubicTo(
      0.778 * _xScaling,
      170.459 * _yScaling,
      -70.722 * _xScaling,
      -92.041 * _yScaling,
      0.778 * _xScaling,
      34.459 * _yScaling,
    );
    path.cubicTo(
      0.778 * _xScaling,
      34.459 * _yScaling,
      0.778 * _xScaling,
      34.459 * _yScaling,
      0.778 * _xScaling,
      34.459 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

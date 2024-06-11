import 'package:flutter/material.dart';
import 'verificacionOTP.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
              clipper: MyClipperButton(),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
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
                      SizedBox(height: 50),
                      Image.asset(
                        'lib/images/olvidastecontra.png',
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No te preocupes, esto ocurre. Introduce la dirección de correo electrónico vinculada a tu cuenta.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      TextField(
                        controller: _emailController,
                        style: TextStyle(fontSize: 14.0),
                        decoration: InputDecoration(
                          labelText: 'Ingrese su correo',
                          prefixIcon: Icon(Icons.email_rounded),
                          labelStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      SizedBox(height: 45.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificacionOTP()));
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
                          'Enviar Código',
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

class MyClipperButton extends CustomClipper<Path> {
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

import 'package:appmgtecnology/cambiocontra.dart';
import 'package:flutter/material.dart';

class VerificacionOTP extends StatefulWidget {
  const VerificacionOTP({Key? key}) : super(key: key);

  @override
  _VerificacionOTPState createState() => _VerificacionOTPState();
}

class _VerificacionOTPState extends State<VerificacionOTP> {
  final List<TextEditingController> _otpControllers =
      List.generate(5, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

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
                        'Verificación OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/otp_image.png',
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Ingrese el código de verificación',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'que hemos enviado a su correo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return SizedBox(
                            width: 40,
                            child: TextField(
                              controller: _otpControllers[index],
                              focusNode: _focusNodes[index],
                              style: TextStyle(fontSize: 20.0),
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  if (index + 1 != _otpControllers.length) {
                                    FocusScope.of(context)
                                        .requestFocus(_focusNodes[index + 1]);
                                  } else {
                                    _focusNodes[index].unfocus();
                                  }
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CambioContrasena()));
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
                          'Verificar',
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

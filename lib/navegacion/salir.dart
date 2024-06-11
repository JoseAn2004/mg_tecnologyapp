import 'package:flutter/material.dart';

class SalirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Llama a la función de logout tan pronto como la página se construya.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logout(context);
    });

    return Container(
      child: Center(
        child: Text("Saliendo..."),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Aquí puedes limpiar los datos de sesión, por ejemplo, usando SharedPreferences.
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    // Luego navegas a la pantalla de inicio de sesión.
    Navigator.pushReplacementNamed(context, '/login');
  }
}

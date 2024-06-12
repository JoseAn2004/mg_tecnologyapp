import 'package:appmgtecnology/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Asegúrate de importar las opciones de configuración de Firebase
import 'package:appmgtecnology/inicioprincipal.dart'; // Importa tus archivos necesarios
import 'package:appmgtecnology/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => MyLoginPage(),
        '/principal': (context) => VentanaPrincipal(),
      },
    );
  }
}

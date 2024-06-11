import 'package:flutter/material.dart';

class Myheaderdrawer extends StatefulWidget {
  @override
  State<Myheaderdrawer> createState() => _MyheaderdrawerState();
}

class _MyheaderdrawerState extends State<Myheaderdrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/FONDO_PERFIL.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('lib/images/fotoperfil.png'),
              ),
            ),
          ),
          Text(
            "Rapid tech",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "info@gmail.com",
            style: TextStyle(color: Color.fromARGB(255, 253, 253, 253)),
          ),
        ],
      ),
    );
  }
}

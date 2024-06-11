import 'package:flutter/material.dart';

class ajustesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildIcono(),
          SizedBox(height: 15),
          _buildTextField('Nombre'),
          SizedBox(height: 15),
          _buildTextField('Apellido'),
          SizedBox(height: 15),
          _buildTextField('Numero Telefónico'),
          SizedBox(height: 15),
          _buildTextField('Correo'),
          SizedBox(height: 15),
          _buildTextField('Contraseña'),
          SizedBox(height: 15),
          _buildEditarButton(),
        ],
      ),
    );
  }

  Widget _buildIcono() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.0),
      child: Icon(
        Icons.person,
        size: 150.0,
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return SizedBox(
      width: 400,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildEditarButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.bottomRight,
      child: RawMaterialButton(
        onPressed: () {
          // Lógica para la acción de editar
        },
        shape: CircleBorder(),
        padding: EdgeInsets.all(15.0),
        fillColor: Colors.blue,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}

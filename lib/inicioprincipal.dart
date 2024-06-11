import 'package:appmgtecnology/navegacion/Inicio.dart';
import 'package:appmgtecnology/navegacion/ajustes.dart';
import 'package:appmgtecnology/navegacion/productos.dart';
import 'package:appmgtecnology/navegacion/salidas.dart';
import 'package:appmgtecnology/navegacion/inventario.dart';

import 'package:flutter/material.dart';
import '2drawerlist.dart';

class VentanaPrincipal extends StatefulWidget {
  @override
  _VentanaPrincipalState createState() => _VentanaPrincipalState();
}

class _VentanaPrincipalState extends State<VentanaPrincipal> {
  var currentPage = DrawerSections.Inicio;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Inicio) {
      container = inipage();
    } else if (currentPage == DrawerSections.Productos) {
      container = Productspage();
    } else if (currentPage == DrawerSections.Inventario) {
      container = inventarioPage();
    } else if (currentPage == DrawerSections.Salidas) {
      container = salidasPage();
    } else if (currentPage == DrawerSections.Ajustes) {
      container = ajustesPage();
    } else if (currentPage == DrawerSections.Salir) {
      container = null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF332FEE),
        title: Text('Principal'),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Myheaderdrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Inicio", Icons.dashboard_outlined,
              currentPage == DrawerSections.Inicio),
          menuItem(2, "Productos", Icons.add_box_outlined,
              currentPage == DrawerSections.Productos),
          menuItem(3, "Inventario", Icons.list_outlined,
              currentPage == DrawerSections.Inventario),
          menuItem(4, "Salidas", Icons.car_crash_outlined,
              currentPage == DrawerSections.Salidas),
          menuItem(5, "Ajustes", Icons.settings_outlined,
              currentPage == DrawerSections.Ajustes),
          menuItem(6, "Salir", Icons.exit_to_app_outlined,
              currentPage == DrawerSections.Salir),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.Inicio;
            } else if (id == 2) {
              currentPage = DrawerSections.Productos;
            } else if (id == 3) {
              currentPage = DrawerSections.Inventario;
            } else if (id == 4) {
              currentPage = DrawerSections.Salidas;
            } else if (id == 5) {
              currentPage = DrawerSections.Ajustes;
            } else if (id == 6) {
              currentPage = DrawerSections.Salir;
              Navigator.pushReplacementNamed(context, '/login');
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 24.0,
                  color: selected ? Colors.blue : Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: selected ? Colors.blue : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  Inicio,
  Productos,
  Inventario,
  Salidas,
  Ajustes,
  Salir,
}

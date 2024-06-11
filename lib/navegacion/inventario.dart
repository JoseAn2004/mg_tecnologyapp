import 'package:flutter/material.dart';

class inventarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // Controladores para los campos de texto
              TextEditingController nombreController = TextEditingController();
              TextEditingController descripcionController =
                  TextEditingController();
              TextEditingController categoriaController =
                  TextEditingController();
              TextEditingController precioVentaController =
                  TextEditingController();
              TextEditingController precioCompraController =
                  TextEditingController();
              ValueNotifier<int> cantidadNotifier = ValueNotifier<int>(0);

              return AlertDialog(
                content: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Imagen de icono
                        Center(
                          child: CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.checklist, size: 50),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Cantidad
                        Center(
                          child: Column(
                            children: [
                              Text("Cantidad", style: TextStyle(fontSize: 18)),
                              ValueListenableBuilder<int>(
                                valueListenable: cantidadNotifier,
                                builder: (context, cantidad, child) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          if (cantidad > 0) {
                                            cantidadNotifier.value =
                                                cantidad - 1;
                                          }
                                        },
                                      ),
                                      Text(
                                        '$cantidad',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          cantidadNotifier.value = cantidad + 1;
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Nombre
                        Text("Nombre:", style: TextStyle(fontSize: 18)),
                        TextField(
                          controller: nombreController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nombre del producto",
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        // Descripción
                        Text("Descripción:", style: TextStyle(fontSize: 18)),
                        TextField(
                          controller: descripcionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Descripción del producto",
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        // Categoría
                        Text("Categoría:", style: TextStyle(fontSize: 18)),
                        TextField(
                          controller: categoriaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Categoría del producto",
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        // Precio de venta
                        Text("Precio de Venta:",
                            style: TextStyle(fontSize: 18)),
                        TextField(
                          controller: precioVentaController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Precio de venta del producto",
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        // Precio de compra
                        Text("Precio de Compra:",
                            style: TextStyle(fontSize: 18)),
                        TextField(
                          controller: precioCompraController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Precio de compra del producto",
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancelar"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Aquí puedes usar los valores ingresados en los campos de texto
                      String nombre = nombreController.text;
                      String descripcion = descripcionController.text;
                      String categoria = categoriaController.text;
                      double precioVenta =
                          double.parse(precioVentaController.text);
                      double precioCompra =
                          double.parse(precioCompraController.text);
                      int cantidad = cantidadNotifier.value;

                      // Aquí puedes hacer algo con los datos ingresados, como enviarlos a una base de datos, etc.

                      // Cerrar el diálogo
                      Navigator.of(context).pop();
                    },
                    child: Text("Guardar"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

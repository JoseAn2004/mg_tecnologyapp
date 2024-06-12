import 'package:flutter/foundation.dart'; // Necesario para kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class inventarioPage extends StatelessWidget {
  const inventarioPage({super.key});

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
              ValueNotifier<File?> imageNotifier = ValueNotifier<File?>(null);
              ValueNotifier<String?> imageUrlNotifier =
                  ValueNotifier<String?>(null);

              return AlertDialog(
                title: Text('Agregar Producto'),
                content: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _buildFormSection('Nombre', nombreController),
                        _buildFormSection('Descripción', descripcionController),
                        _buildFormSection('Categoría', categoriaController),
                        Row(
                          children: [
                            Expanded(
                              child: _buildFormSection(
                                  'Precio de Venta', precioVentaController,
                                  isNumber: true),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: _buildFormSection(
                                  'Precio de Compra', precioCompraController,
                                  isNumber: true),
                            ),
                          ],
                        ),
                        _buildCantidadSection(cantidadNotifier),
                        _buildImagePickerSection(
                            imageNotifier, imageUrlNotifier, context),
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Simplemente cerrar el diálogo sin realizar ninguna acción
                      Navigator.of(context).pop();
                    },
                    child: Text('Guardar'),
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

  Widget _buildFormSection(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : null,
        decoration: InputDecoration(
          labelText: label,
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildCantidadSection(ValueNotifier<int> cantidadNotifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Cantidad', style: TextStyle(fontSize: 18)),
          ValueListenableBuilder<int>(
            valueListenable: cantidadNotifier,
            builder: (context, cantidad, child) {
              return Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (cantidad > 0) {
                        cantidadNotifier.value = cantidad - 1;
                      }
                    },
                  ),
                  Text('$cantidad', style: TextStyle(fontSize: 18)),
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
    );
  }

  Widget _buildImagePickerSection(ValueNotifier<File?> imageNotifier,
      ValueNotifier<String?> imageUrlNotifier, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Imagen del Producto', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8.0),
          ValueListenableBuilder(
            valueListenable: kIsWeb ? imageUrlNotifier : imageNotifier,
            builder: (context, value, child) {
              if (kIsWeb) {
                String? imageUrl = value as String?;
                return Column(
                  children: [
                    if (imageUrl != null)
                      Image.network(
                        imageUrl,
                        height: 150,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Text('Error al cargar la imagen');
                        },
                      )
                    else
                      Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text('No Image Selected'),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => _pickImage(imageNotifier,
                              imageUrlNotifier, ImageSource.gallery, context),
                          child: Text('Seleccionar Imagen'),
                        ),
                        ElevatedButton(
                          onPressed: () => _pickImage(imageNotifier,
                              imageUrlNotifier, ImageSource.camera, context),
                          child: Text('Tomar Foto'),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ],
                );
              } else {
                File? imageFile = value as File?;
                return Column(
                  children: [
                    if (imageFile != null)
                      Image.file(
                        imageFile,
                        height: 150,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Text('Error al cargar la imagen');
                        },
                      )
                    else
                      Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text('No Image Selected'),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => _pickImage(imageNotifier,
                              imageUrlNotifier, ImageSource.gallery, context),
                          child: Text('Seleccionar Imagen'),
                        ),
                        ElevatedButton(
                          onPressed: () => _pickImage(imageNotifier,
                              imageUrlNotifier, ImageSource.camera, context),
                          child: Text('Tomar Foto'),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(
      ValueNotifier<File?> imageNotifier,
      ValueNotifier<String?> imageUrlNotifier,
      ImageSource source,
      BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        if (kIsWeb) {
          imageUrlNotifier.value = pickedFile.path;
        } else {
          imageNotifier.value = File(pickedFile.path);
        }
      }
    } catch (e) {
      // Manejar cualquier error que ocurra durante la selección de la imagen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al seleccionar la imagen: $e'),
        ),
      );
    }
  }
}

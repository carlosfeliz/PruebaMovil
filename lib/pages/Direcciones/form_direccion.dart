

import 'package:flutter/material.dart';
import 'package:prueva_movil_clientes_app/models/cliente.dart';
import 'package:prueva_movil_clientes_app/models/direccion.dart';
import 'package:prueva_movil_clientes_app/models/empresa.dart';
import 'package:prueva_movil_clientes_app/statics/arguments.dart';

import '../../models/context.dart';

class DireccionForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final especieController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //EmpresaModel animal = ModalRoute.of(context).settings.arguments;
    DireccionModel animal = SettingsApp.direccionSelected;
    nombreController.text = animal.direccion!;
    especieController.text = "";

    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text('Agregar Direcciones'),
        backgroundColor: const Color.fromARGB(255, 13, 46, 212)),
        
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form (
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nombreController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "El direccion es obligatorio";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Direccion"
                      ),

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /*
                    TextFormField(
                      controller: especieController,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "La especie es obligatoria";
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Especie"
                      ),
                    ),*/
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shadowColor: Colors.black
                  ),
                      
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (animal.direccionId! > 0) {
                              animal.direccion = nombreController.text;
                              //animal.apellido = especieController.text;
                              DB.updateDireccion(animal);
                            }
                            else {
                              DB.insertDireccion(DireccionModel(direccion: nombreController.text,clienteId: SettingsApp.clienteSelected.clienteId!));
                            }
                            Navigator.pushNamed(context,"/");
                          }
                        },
                        child: const Text("Guardar"),
                        
                        )
                  ]
              )
          ),
        )
    );
  }

}
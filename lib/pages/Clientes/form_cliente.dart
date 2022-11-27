

// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:prueva_movil_clientes_app/models/cliente.dart';
import 'package:prueva_movil_clientes_app/models/empresa.dart';
import 'package:prueva_movil_clientes_app/statics/arguments.dart';
import 'package:path/path.dart';

import '../../models/context.dart';

class ClienteForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final especieController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //EmpresaModel animal = ModalRoute.of(context).settings.arguments;
    ClienteModel animal = SettingsApp.clienteSelected;
    nombreController.text = animal.nombre!;
    especieController.text = animal.apellido!!;

    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text('Agregar CLientes'),
        backgroundColor: const Color.fromARGB(255, 13, 46, 212)),
        
        body: Container(
            child: Padding(
              child: Form (
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: nombreController,
                          validator: (value) {
                            if (value!.isEmpty)
                              // ignore: curly_braces_in_flow_control_structures
                              return "El nombre es obligatorio";
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Nombre"
                          ),

                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: especieController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "El apellido es obligatoria";
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Apellido"
                          ),
                        ),
                        ElevatedButton(
                           style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shadowColor: Colors.black
                  ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (animal.clienteId! > 0) {
                                  animal.nombre = nombreController.text;
                                  animal.apellido = especieController.text;
                                  DB.updateCliente(animal);
                                }
                                else
                                  DB.insertCliente(ClienteModel(nombre: nombreController.text, apellido: especieController.text,empresaId: SettingsApp.empresasSelected.empresaId!));
                                Navigator.pushNamed(context,"/");
                              }
                            },
                            child: const Text("Guardar"))
                      ]
                  )
              ),
              padding: const EdgeInsets.all(15),
            )
        )
    );
  }

}
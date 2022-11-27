

import 'package:flutter/material.dart';
import 'package:prueva_movil_clientes_app/models/empresa.dart';
import 'package:prueva_movil_clientes_app/statics/arguments.dart';

import '../../models/context.dart';

class Editar extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final especieController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //EmpresaModel animal = ModalRoute.of(context).settings.arguments;
    EmpresaModel animal = SettingsApp.empresasSelected;
    nombreController.text = animal.nombre!;
    especieController.text = animal.direccion!;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: const Text("Agergar Empresas"),
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
                          return "El nombre es obligatorio";
                        }
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
                        if (value!.isEmpty) {
                          return "La direccion es obligatoria";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Direccion"
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shadowColor: Colors.black
                  ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (animal.empresaId! > 0) {
                              animal.nombre = nombreController.text;
                              animal.direccion = especieController.text;
                              DB.update(animal);
                            }
                            else {
                              DB.insert(EmpresaModel(nombre: nombreController.text, direccion: especieController.text));
                            }
                            Navigator.pushNamed(context,"/");
                          }
                        },
                        child: const Text("Guardar"),)
                  ]
              )
          ),
        )
    );
  }

}
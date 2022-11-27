import 'package:flutter/material.dart';

import '../principal.dart';

class AddEmpresa extends StatelessWidget {
  const AddEmpresa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Agregar Empresas'),
          backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte un Nombre',
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte un Slogan',
                labelText: 'Slogan',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte un Telefono',
                labelText: 'Telefono',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte un Email',
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Agergar'))),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shadowColor: Colors.black
                  ),
                        onPressed: () {
                          _dialogBuilder(context);
                        },
                        child: const Text('Cancelar'))),
              ],
            )
          ]),
        )),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('!Advertencia!'),
        content: const Text('Seguro que quieres Cansselar la Operacion ???'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('SI'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Principal()));
            },
          ),
        ],
      );
    },
  );
}

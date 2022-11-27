import 'package:flutter/material.dart';
import 'package:prueva_movil_clientes_app/pages/principal.dart';
import 'package:path/path.dart';

class RegistroCliente extends StatelessWidget {
  const RegistroCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agregar Clientes'),
        backgroundColor: Color.fromARGB(255, 0, 42, 255)),
        
        body: Padding(

          
    
          padding: const EdgeInsets.all(10.0),
          child: Form(child: SingleChildScrollView(child: Column(children: [
            Image.asset('assets/images/logo.png',height: 150,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte un Nombre',
                labelText: 'Nombre' ,
                
              ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte un Apellido',
                labelText: 'Apellido' ,
                
              ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte un Telefono',
                labelText: 'Telefono' ,
                
              ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
              decoration: const InputDecoration(
                hintText: 'Inserte una Direccion',
                labelText: 'Direccion' ,
                
              ),
            ),
            
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: ElevatedButton(
                  
                  onPressed: () {}, child: const Text('Agergar'))),
                const SizedBox(width: 15,),
                Expanded(child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shadowColor: Colors.black
                  ),
                  onPressed: () {
                    _dialogBuilder(context);
                    
                  }, child: const Text('Cancelar'))),
              ],
            )
            
            
          ]),)),
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
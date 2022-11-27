import 'package:flutter/material.dart';

class Actualizar extends StatelessWidget {
  const Actualizar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Actualizar Clientes'),
        backgroundColor:const Color.fromARGB(255, 13, 46, 212)),
        
        
        body: Padding(

          
    
          padding: const EdgeInsets.all(10.0),
          child: Form(child: SingleChildScrollView(child: Column(children: [
            Image.asset('assets/images/logo.png',height: 150,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Editar Nombre',
                labelText: '' ,
                
              ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
              decoration: const InputDecoration(
                hintText: 'Editar Apellido',
                labelText: 'Apellido' ,
                
              ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
              decoration: const InputDecoration(
                hintText: 'Editar Telefono',
                labelText: '' ,
                
              ),
            ),
            const SizedBox(height: 10,),
             TextFormField(
              decoration: const InputDecoration(
                hintText: 'Editar Direccion',
                labelText: '' ,
                
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: ElevatedButton(
                  onPressed: () {}, child: const Text('Actualizar'))),
                const SizedBox(width: 15,),
                Expanded(child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shadowColor: Colors.black
                  ),
                  onPressed: () {}, child: const Text('Cancelar'))),
              ],
            )
            
            
          ]),)),
        ),
    );
  }
}
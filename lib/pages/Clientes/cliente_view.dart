import 'package:flutter/material.dart';
import 'package:prueva_movil_clientes_app/models/cliente.dart';
import 'package:prueva_movil_clientes_app/models/direccion.dart';
import 'package:prueva_movil_clientes_app/pages/Clientes/addCliente.dart';
import 'package:prueva_movil_clientes_app/pages/Clientes/form_cliente.dart';
import 'package:prueva_movil_clientes_app/pages/Direcciones/direccion_view.dart';
import 'package:prueva_movil_clientes_app/pages/Empresas/addEmpresa.dart';
import 'package:prueva_movil_clientes_app/pages/Empresas/form_empresa.dart';
import 'package:prueva_movil_clientes_app/pages/btnAdd.dart';
import 'package:prueva_movil_clientes_app/statics/arguments.dart';
import 'package:path/path.dart';

import '../../models/context.dart';
import '../principal.dart';




class ClienteView extends StatefulWidget {
  const ClienteView({super.key});

  @override
  State<ClienteView> createState() => _ClienteViewState();
}

class _ClienteViewState extends State<ClienteView> {
 
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(SettingsApp.empresasSelected!.nombre!),
        backgroundColor: const Color.fromARGB(255, 13, 46, 212)),
        body:Lista(),



         floatingActionButton: ExpandableFab(
  distance: 112.0,
  children: [
    
    ActionButton(
      onPressed: () {
        SettingsApp.clienteSelected.clienteId=0;
        SettingsApp.clienteSelected.nombre="";
        SettingsApp.clienteSelected.apellido="";
        //Navigator.pushNamed(context,"/empresaform",arguments: SettingsApp.empresasSelected);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  ClienteForm()));

      },
      icon: const Icon(Icons.add),
    ),
    ActionButton(
      onPressed: () {
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  const Principal()));
      },
      icon: const Icon(Icons.paste_sharp),
    ),
  ],
),

    //      floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //        Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>  const RegistroCliente()));
    //       },
    //       child: const Icon(Icons.add),
    //      ) ,
         
    );
    
  }
}

class Lista extends StatefulWidget {

  @override
  _MiLista createState() => _MiLista();

}

class _MiLista extends State<Lista> {

  List<ClienteModel> animales = [];

  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<ClienteModel> auxAnimal = await DB.clientes();

    setState(() {
      animales = auxAnimal;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: animales.length,
        itemBuilder:
            (context, i) =>
            Dismissible(key: Key(i.toString()),
                direction: DismissDirection.startToEnd,
                background: Container (
                    color: Colors.red,
                    padding: const EdgeInsets.only(left: 5),
                    child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete, color: Colors.white)
                    )
                ),
                confirmDismiss: (_)  {
                 return showDialog(context: context, builder: (_)=>  AlertDialog(title:   const Text("Eliminar Registro"),
                  content: const Text("Seguro que desea Eliminar este Registro??\nEste Cliente sera borrado por completo de la Base de Datos????"), 
                  
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop(true);
                      

                    }, child:   const Text("SI")),
                    TextButton(onPressed: () {
                       Navigator.of(context).pop(false);
                      
                    }, child:  const Text("NO"))
                  ],
                  ));
                  
                 
                }, 
                onDismissed: (direction) {
                  DB.deleteCliente(animales[i]);
                },
                child: ListTile(
                    title: Text(animales[i].nombre!),
                    trailing:Row(
                      mainAxisSize: MainAxisSize.min
                      ,children: [
                      MaterialButton(
                          onPressed: () {
                            SettingsApp.clienteSelected = animales[i];
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ClienteForm()));
                            //Navigator.pushNamed(context,"/empresaform",arguments: animales[i]);
                          },
                          child: const Icon(Icons.edit)
                      ),
                      MaterialButton(
                          onPressed: () {

                            SettingsApp.clienteSelected = animales[i];
                            SettingsApp.direccionSelected = new DireccionModel(clienteId:animales[i].clienteId! ) ;
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const DireccionView()));
                            //Navigator.pushNamed(context,"/empresaform",arguments: animales[i]);
                          },
                          child: const Icon(Icons.remove_red_eye)
                      )

                    ],
                    )
                )
            )
    );
  }

}
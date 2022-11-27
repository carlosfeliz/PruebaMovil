import 'package:prueva_movil_clientes_app/models/empresa.dart';

import '../models/cliente.dart';
import '../models/direccion.dart';

class SettingsApp
{
  static EmpresaModel empresasSelected=new EmpresaModel();
  static ClienteModel clienteSelected=new ClienteModel(empresaId: 0);
  static DireccionModel direccionSelected=new DireccionModel(clienteId: 0);
}
class ClienteModel {

  int? clienteId;
  String? nombre;
  String? apellido;
  int empresaId;

  ClienteModel({this.clienteId, this.nombre, this.apellido, required this.empresaId });

  Map<String, dynamic> toMap() {
    return { 'clienteId': clienteId, 'nombre': nombre, 'apellido': apellido,'empresaId':empresaId};
  }
}
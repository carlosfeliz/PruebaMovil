class DireccionModel {

  int? direccionId;
  String? direccion;
  int clienteId;

  DireccionModel({this.direccionId, this.direccion, required this.clienteId });

  Map<String, dynamic> toMap() {
    return { 'direccionId': direccionId, 'direccion': direccion, 'clienteId': clienteId};
  }
}
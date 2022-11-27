class EmpresaModel {

  int? empresaId;
  String? nombre;
  String? direccion;

  EmpresaModel({this.empresaId, this.nombre, this.direccion});

  Map<String, dynamic> toMap() {
    return { 'empresaId': empresaId, 'nombre': nombre, 'direccion': direccion};
  }
}
class Response {
  bool? error;
  int? codeError;
  String? errorMessage;
  Oferta_Residuo? oferta_residuo;

  Response({this.error, this.codeError, this.errorMessage, this.oferta_residuo});

  Response.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    codeError = json['code_error'];
    errorMessage = json['error_message'];
    oferta_residuo = json['response'] != null
        ? new Oferta_Residuo.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['code_error'] = this.codeError;
    data['error_message'] = this.errorMessage;
    if (this.oferta_residuo != null) {
      data['response'] = this.oferta_residuo!.toJson();
    }
    return data;
  }
}

class Oferta_Residuo {
  String residuo = '';
  int cantidad = 0;

  Oferta_Residuo();

  Oferta_Residuo.fromJson(Map<String, dynamic> json) {
    residuo = json['residuo'];
    cantidad = json['cantidad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['residuo'] = this.residuo;
    data['cantidad'] = this.cantidad;
    return data;
  }
}
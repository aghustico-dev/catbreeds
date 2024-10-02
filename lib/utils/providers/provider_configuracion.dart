import 'package:flutter/foundation.dart';

// import 'package:charcoal/domain/entities/entity.dart' as domain;

class ProviderConfiguracion extends ChangeNotifier {
  // Map<String, dynamic> _countryLocale = {};
  // Map<String, dynamic> get countryLocale => _countryLocale;
  // set countryLocale(Map<String, dynamic> value) {
  //   _countryLocale = value;
  //   notifyListeners();
  // }

  // List<domain.PaisEntity> _listaPaises = [];
  // List<domain.PaisEntity> get listaPaises => _listaPaises;
  // set listaPaises(List<domain.PaisEntity> value) {
  //   _listaPaises = value;
  //   notifyListeners();
  // }

  // List<domain.CertificadoEntity> _listaCertificados = [];
  // List<domain.CertificadoEntity> get listaCertificados => _listaCertificados;
  // set listaCertificados(List<domain.CertificadoEntity> value) {
  //   _listaCertificados = value;
  //   notifyListeners();
  // }

  String _authToken = "";
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    notifyListeners();
  }

  // domain.UsuarioEntity _usuarioLogeado = domain.UsuarioEntity();
  // domain.UsuarioEntity get usuarioLogeado => _usuarioLogeado;
  // set usuarioLogeado(domain.UsuarioEntity value) {
  //   _usuarioLogeado = value;
  //   notifyListeners();
  // }
}

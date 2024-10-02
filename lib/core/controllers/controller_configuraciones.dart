import 'package:flutter/material.dart';
// import 'package:charcoal/data/data.dart';
// import 'package:provider/provider.dart';

// import 'package:charcoal/domain/entities/entity.dart' as domain;
// import 'package:country_codes/country_codes.dart';
// import 'package:charcoal/utils/util.dart' as utils;
// import 'package:charcoal/core/core.dart' as core;

deviceIsTablet(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide >= 600;
}

// loadConfiguraciones(BuildContext context) async {
//   utils.ProviderConfiguracion pconfig =
//       Provider.of<utils.ProviderConfiguracion>(context, listen: false);

//   await Future.wait([
//     obtenerListaPaises(context),
//     obtenerListaCertificados(context),
//     getUsuario(context),
//     getDeviceLocale(context)
//   ]).then((result) {
//     pconfig.listaPaises = result[0] as List<domain.PaisEntity>;
//     pconfig.listaCertificados = result[1] as List<domain.CertificadoEntity>;
//     pconfig.usuarioLogeado = result[2] as UsuarioModel;
//     // pconfig.usuarioLogeado = result[2] as domain.UsuarioEntity;
//     pconfig.countryLocale = result[3] as Map<String, dynamic>;
//     if (utils.isNullOrEmpty(pconfig.usuarioLogeado.id)) {
//       utils.goToLandingScreen(context);
//     } else {
//       utils.goToPortalHome(context);
//     }
//   });
// }

// Future<List<domain.PaisEntity>> obtenerListaPaises(BuildContext context) async {
//   core.MaestroService service = core.MaestroService();
//   return await service.getPais().then((result) {
//     if (utils.isNullOrEmpty(result)) {
//       return [];
//     } else {
//       return result.response;
//     }
//   });
// }

// Future<List<domain.CertificadoEntity>> obtenerListaCertificados(
//     BuildContext context) async {
//   core.MaestroService service = core.MaestroService();
//   return await service.getCertificado().then((result) {
//     if (utils.isNullOrEmpty(result)) {
//       return [];
//     } else {
//       return result.response;
//     }
//   });
// }

// Future<List<domain.PerfilEntity>> obtenerListaPerfiles(
//     BuildContext context) async {
//   core.MaestroService service = core.MaestroService();
//   return await service.getPerfil().then((result) {
//     if (utils.isNullOrEmpty(result)) {
//       return [];
//     } else {
//       return result.response;
//     }
//   });
// }

// Future<domain.UsuarioEntity> getUsuario(BuildContext context) async {
//   final core.SecurityService securityService = core.SecurityService();

//   utils.ProviderConfiguracion pconfig =
//       Provider.of<utils.ProviderConfiguracion>(context, listen: false);

//   var authToken = await securityService.obtenerAuthToken();
//   pconfig.authToken = authToken.response;

//   if (pconfig.authToken.isNotEmpty) {
//     final core.AuthenticationService authenticationService =
//         core.AuthenticationService();
//     return await authenticationService.get().then((responseInfo) {
//       if (!utils.isNullOrEmpty(responseInfo.response)) {
//         pconfig.usuarioLogeado = responseInfo.response;
//         return pconfig.usuarioLogeado;
//       }
//       return domain.UsuarioEntity();
//     });
//   } else {
//     return domain.UsuarioEntity();
//   }
// }

// Future<Map<String, dynamic>> getDeviceLocale(BuildContext context) async {
//   await CountryCodes.init();
//   final CountryDetails details = CountryCodes.detailsForLocale();
//   return {
//     'codeLocale': details.alpha2Code,
//     'dialLocale': details.dialCode,
//     'localizedName': details.localizedName
//   };
// }

// validatePerfilBodyHome(BuildContext context) {
//   utils.ProviderConfiguracion pconfig =
//       Provider.of<utils.ProviderConfiguracion>(context, listen: false);

//   switch (pconfig.usuarioLogeado.perfil) {
//     case 'minorista':
//       return Container();
//     case 'mayorista':
//       return Container();
//     case 'fabricante':
//       return Container();
//     case 'productor':
//       return Container();

//     default:
//       utils.goToGetPlan(context);
//   }
// }

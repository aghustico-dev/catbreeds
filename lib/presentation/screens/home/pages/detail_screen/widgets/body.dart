import 'package:catbreeds/domain/entities/entity_breed.dart';
import 'package:catbreeds/presentation/common/theme/theme_text_scale_size.dart';
import 'package:catbreeds/utils/constants/const_app_global.dart';
import 'package:flutter/material.dart';

class BodyDetailScreenPage extends StatelessWidget {
  const BodyDetailScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    late BreedEntity breed;
    Map<dynamic, dynamic> arguments =
        (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
            as Map;

    breed = arguments['breed'];

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 400,
            child: _buildImagenCat(arguments['urlImagen']),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (MediaQuery.sizeOf(context).width *
                    GlobalConstants.paddingWidth),
                vertical: 10,
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildContenidoDescriptivo(context, breed.description!),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(context,
                        "Pais: ${breed.origin} (${breed.countryCode})"),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Inteligencia: ${breed.intelligence}",
                      requireIndicador: true,
                      valorDeIndicador: breed.intelligence!,
                    ),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Adaptabilidad: ${breed.adaptability}",
                      requireIndicador: true,
                      valorDeIndicador: breed.adaptability!,
                    ),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Nivel de afecto: ${breed.affectionLevel}",
                      requireIndicador: true,
                      valorDeIndicador: breed.affectionLevel!,
                    ),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Apto para niños: ${breed.childFriendly}",
                      requireIndicador: true,
                      valorDeIndicador: breed.childFriendly!,
                    ),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Amigable con los gatos: ${breed.catFriendly}",
                      requireIndicador: true,
                      valorDeIndicador: breed.catFriendly!,
                    ),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Amigable con los perros: ${breed.dogFriendly}",
                      requireIndicador: true,
                      valorDeIndicador: breed.dogFriendly!,
                    ),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Aseo: ${breed.grooming}",
                      requireIndicador: true,
                      valorDeIndicador: breed.grooming!,
                    ),
                    const SizedBox(height: 15),
                    _buildContenidoDescriptivo(
                      context,
                      "Problemas de salud: ${breed.healthIssues}",
                      requireIndicador: true,
                      valorDeIndicador: breed.healthIssues!,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImagenCat(String urlImagen) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      child: Image.network(
        urlImagen,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContenidoDescriptivo(BuildContext context, String texto,
      {bool requireIndicador = false, int valorDeIndicador = 0}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          texto,
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: GlobalConstants.primary),
          textScaler: ScaleSize.textScaler(context),
        ),
        (requireIndicador)
            ? Padding(
                padding: const EdgeInsets.only(top: 3),
                child: LinearProgressIndicator(
                  value: (valorDeIndicador / 5),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(6),
                  backgroundColor: GlobalConstants.primary,
                  color: GlobalConstants.secondary,
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

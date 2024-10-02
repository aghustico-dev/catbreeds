import 'package:catbreeds/domain/entities/entity_cat.dart';
import 'package:flutter/material.dart';

import 'package:catbreeds/core/controllers/controller_configuraciones.dart';
import 'package:catbreeds/presentation/common/common.dart';
import 'package:catbreeds/utils/util.dart';
import 'package:catbreeds/presentation/common/common.dart' as widgets;

class BodyLandingScreenPage extends StatefulWidget {
  const BodyLandingScreenPage({super.key});

  @override
  State<BodyLandingScreenPage> createState() => _BodyLandingScreenPageState();
}

class _BodyLandingScreenPageState extends State<BodyLandingScreenPage> {
  late Future loadCats;
  final formkey = GlobalKey<FormState>();
  String filtro = '';
  TextEditingController filtroController = TextEditingController();
  int page = 0;

  // _scrollController.a

  @override
  void didChangeDependencies() {
    loadCats = obtenerCats(context, page, breed: filtro);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      padding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.sizeOf(context).width *
            GlobalConstants.paddingMinWidth),
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildFormularioBusqueda(),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: _buildListaDeGatos()),
          ),
        ],
      ),
    );
  }

  Widget _buildFormularioBusqueda() {
    return Form(
      key: formkey,
      child: CustomTextInputField(
        hintText: 'Ingrese un criterio de búsqueda',
        maxLines: 1,
        maxLength: 25,
        controller: filtroController,
        suffixIcon: IconButton(
          onPressed: () {
            page = 0;
            loadCats = obtenerCats(context, page, breed: filtroController.text);
            setState(() {});
          },
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildListaDeGatos() {
    return FutureBuilder(
        future: loadCats,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return widgets.shimmerBuilder(const widgets.SkeletonCardCat());
            case ConnectionState.done:
              return buildListarCats(snapshot.data ?? []);
            default:
              return const SizedBox.shrink();
          }
        });
  }

  Widget _buildNotFound() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.block, size: 140, color: GlobalConstants.secondary),
          const SizedBox(height: 10),
          Text(
            'No hay coincidencias de búsqueda',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: GlobalConstants.primary,
            ),
            textScaler: ScaleSize.textScaler(context),
          )
        ],
      ),
    );
  }

  Widget buildListarCats(List<CatEntity> cats) {
    if (cats.isEmpty) {
      return _buildNotFound();
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (page > 0)
              ? Center(
                  child: FilledButton.tonal(
                    onPressed: () {
                      page--;
                      loadCats = obtenerCats(context, page,
                          breed: filtroController.text);
                      setState(() {});
                    },
                    child: Text(
                      'Anterior página',
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: GlobalConstants.primary,
                      ),
                      textScaler: ScaleSize.textScaler(context),
                    ),
                  ),
                )
              : SizedBox.fromSize(),
          ...List.generate(
            cats.length,
            (index) {
              return buildCardCat(cats[index]);
            },
          ),
          const SizedBox(height: 10),
          Center(
            child: FilledButton.tonal(
              onPressed: () {
                page++;
                loadCats =
                    obtenerCats(context, page, breed: filtroController.text);
                setState(() {});
              },
              child: Text(
                'Siguiente página',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: GlobalConstants.primary,
                ),
                textScaler: ScaleSize.textScaler(context),
              ),
            ),
          )
        ]);
  }

  Widget buildCardCat(CatEntity cat) {
    if (cat.url!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      semanticContainer: true,
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    (cat.breeds!.isNotEmpty)
                        ? "Raza: ${cat.breeds![0].name!}"
                        : 'Información no disponible',
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: GlobalConstants.primary),
                    textScaler: ScaleSize.textScaler(context),
                  ),
                ),
                (cat.breeds!.isNotEmpty)
                    ? InkWell(
                        onTap: () => goToDetails(context, cat.breeds![0].name!,
                            cat.url!, cat.breeds![0]),
                        child: Text(
                          'Más...',
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: GlobalConstants.secondary),
                          textScaler: ScaleSize.textScaler(context),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            // const SizedBox(height: 5),
            Image.network(
              cat.url!,
              width: MediaQuery.sizeOf(context).width,
              height: 310,
              fit: BoxFit.cover,
              scale: ScaleSize.textScaleFactor(context),
            ),
            // const SizedBox(height: 15),
            (cat.breeds!.isNotEmpty)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Origen: ${cat.breeds![0].origin!}",
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: GlobalConstants.primary),
                        textScaler: ScaleSize.textScaler(context),
                      ),
                      Tooltip(
                        message: 'Inteligencia',
                        triggerMode: TooltipTriggerMode.tap,
                        child: Row(
                          children: [
                            Text(
                              cat.breeds![0].intelligence.toString(),
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: GlobalConstants.primary),
                              textScaler: ScaleSize.textScaler(context),
                            ),
                            const Icon(
                              Icons.psychology,
                              size: 22,
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

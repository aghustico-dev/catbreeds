import 'package:catbreeds/domain/entities/entity_breed.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/utils/constants/const_app_local_routing.dart'
    as utils;

void goToReturnBack(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

void goToLandingScreen(BuildContext context) =>
    Navigator.pushNamedAndRemoveUntil(
        context, utils.LocalRouting.landingPage, (route) => false);

void goToDetails(BuildContext context, String title, String urlImagen,
        BreedEntity breed) =>
    Navigator.pushNamed(context, utils.LocalRouting.detailPage,
        arguments: {'title': title, 'urlImagen': urlImagen, 'breed': breed});

import 'package:examen_extraordinario/ui/predictions/predictions.dart';
import 'package:examen_extraordinario/ui/search/search.dart';
import 'package:flutter/material.dart';

class SearchPresenter {
  SearchState _view;

  SearchPresenter(this._view);

  // Método para navegar a las predicciones
  void details(context, id) {
    /*
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PredictionsList(id)),
    );
     */
    // Navigator.of(context).pushNamedAndRemoveUntil('/screen1', (Route<dynamic> route) => false);
  }
}

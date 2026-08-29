import 'package:flutter/foundation.dart';

import '../data/model/models.dart';

class AppState extends ChangeNotifier {
  AppState._();
  static final AppState instance = AppState._();

  PapelUsuario? papelLogado;
  Map<int, bool> respostasQuiz = {};

  void definirPapel(PapelUsuario? papel) {
    papelLogado = papel;
    notifyListeners();
  }

  void definirRespostasQuiz(Map<int, bool> respostas) {
    respostasQuiz = respostas;
    notifyListeners();
  }
}
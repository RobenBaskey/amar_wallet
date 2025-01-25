import 'dart:async';
import 'dart:convert';

import 'package:amar_wallet/module/home/controller/home_event.dart';
import 'package:amar_wallet/module/home/controller/home_state.dart';
import 'package:amar_wallet/module/home/model/card_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ChangeSliderActiveIndexEvent>(_onChangeActiveIndex);
    on<GetCardListEvent>(_onGetCardListEvent);
  }

  FutureOr<void> _onGetCardListEvent(
      GetCardListEvent event, Emitter<HomeState> emit) async {
    try {
      final String jsonString =
          await rootBundle.loadString('asset/json/card_data.json');

      List<dynamic> jsonResponse = jsonDecode(jsonString);
      List<CardModel> list =
          jsonResponse.map((x) => CardModel.fromJson(x)).toList();

      emit(state.copyWith(cardList: list));
    } on Exception catch (e) {
      debugPrint("Error to load card json data. Reason ${e.toString()}");
    }
  }

  FutureOr<void> _onChangeActiveIndex(
      ChangeSliderActiveIndexEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(activeIndex: event.index));
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:amar_wallet/module/home/model/card_model.dart';
import 'package:amar_wallet/module/search/controller/search_event.dart';
import 'package:amar_wallet/module/search/controller/search_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<GetCardListEvent>(_onGetCardListEvent);
    on<SearchCardEvent>(_onSearchCardEvent);
  }

  FutureOr<void> _onGetCardListEvent(
      GetCardListEvent event, Emitter<SearchState> emit) async {
    try {
      final String jsonString =
          await rootBundle.loadString('asset/json/search_card_data.json');

      List<dynamic> jsonResponse = jsonDecode(jsonString);
      List<CardModel> list =
          jsonResponse.map((x) => CardModel.fromJson(x)).toList();

      emit(state.copyWith(cardList: list, searchCardList: list));
    } on Exception catch (e) {
      debugPrint("Error to load card json data. Reason ${e.toString()}");
    }
  }

  FutureOr<void> _onSearchCardEvent(
      SearchCardEvent event, Emitter<SearchState> emit) {
    if (event.data.isEmpty) {
      emit(state.copyWith(searchCardList: state.cardList));
    } else {
      var cardList = <CardModel>[];
      cardList = state.cardList
          .where((item) =>
              item.title.toLowerCase().contains(event.data.toLowerCase()))
          .toList();
      emit(state.copyWith(searchCardList: cardList));
    }
  }
}

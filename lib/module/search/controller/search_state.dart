import 'package:amar_wallet/module/home/model/card_model.dart';

class SearchState {
  SearchState(
      {this.sliderItem = 5,
      this.activeIndex = 0,
      this.cardList = const [],
      this.searchCardList = const []});

  int sliderItem;
  int activeIndex;

  List<CardModel> cardList;
  List<CardModel> searchCardList;

  SearchState copyWith(
      {int? sliderItem,
      int? activeIndex,
      List<CardModel>? cardList,
      List<CardModel>? searchCardList}) {
    return SearchState(
      sliderItem: sliderItem ?? this.sliderItem,
      activeIndex: activeIndex ?? this.activeIndex,
      cardList: cardList ?? this.cardList,
      searchCardList: searchCardList ?? this.searchCardList,
    );
  }
}

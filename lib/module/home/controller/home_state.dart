import 'package:amar_wallet/module/home/model/card_model.dart';

class HomeState {
  HomeState(
      {this.sliderItem = 5, this.activeIndex = 0, this.cardList = const []});

  int sliderItem;
  int activeIndex;

  List<CardModel> cardList;

  HomeState copyWith(
      {int? sliderItem, int? activeIndex, List<CardModel>? cardList}) {
    return HomeState(
      sliderItem: sliderItem ?? this.sliderItem,
      activeIndex: activeIndex ?? this.activeIndex,
      cardList: cardList ?? this.cardList,
    );
  }
}

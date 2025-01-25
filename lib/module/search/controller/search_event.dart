abstract class SearchEvent {
  const SearchEvent();
}

class GetCardListEvent extends SearchEvent {}

class SearchCardEvent extends SearchEvent {
  final String data;
  const SearchCardEvent(this.data);
}

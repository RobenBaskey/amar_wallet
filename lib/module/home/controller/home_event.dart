abstract class HomeEvent {
  const HomeEvent();
}

class GetCardListEvent extends HomeEvent {}

class ChangeSliderActiveIndexEvent extends HomeEvent {
  final int index;
  const ChangeSliderActiveIndexEvent(this.index);
}

part of 'onboard_cubit.dart';

abstract class OnboardState extends Equatable {
  final int currentSlide;

  const OnboardState(this.currentSlide);
}

class OnboardInitial extends OnboardState {
  const OnboardInitial() : super(0);

  @override
  List<Object> get props => [currentSlide];
}

class OnboardPageChanged extends OnboardState {
  final int newSlide;

  const OnboardPageChanged(this.newSlide) : super(newSlide);

  @override
  List<Object> get props => [newSlide];
}

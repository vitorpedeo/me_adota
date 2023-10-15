part of 'account_cubit.dart';

abstract class AccountState extends Equatable {}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountLoading extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountLoaded extends AccountState {
  final bool isLogged;

  AccountLoaded(this.isLogged);

  @override
  List<Object> get props => [isLogged];
}

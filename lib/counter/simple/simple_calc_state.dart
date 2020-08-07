part of '../simple/simple_calc_cubit.dart';

@immutable
abstract class SimpleCalcState {}

class SimpleCalcInitial extends SimpleCalcState {}

class SimpleCalcCalculated extends SimpleCalcState {
  SimpleCalcCalculated(this.values);

  final Map<String, num> values;
}

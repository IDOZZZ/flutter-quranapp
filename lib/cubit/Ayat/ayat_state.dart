part of 'ayat_cubit.dart';

abstract class AyatCubitState extends Equatable {
  const AyatCubitState();

  @override
  List<Object> get props => [];
}

class AyatCubitInitial extends AyatCubitState {}

class AyatLoading extends AyatCubitState {}


class AyatLoaded extends AyatCubitState {
  final SurahDetailModel detail;


  const AyatLoaded({required this.detail});


  @override
  List<Object> get props => [detail];
}


class AyatError extends AyatCubitState {
  final String message;


  const AyatError({required this.message});


  @override
  List<Object> get props => [message];
}



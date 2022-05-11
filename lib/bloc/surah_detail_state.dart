part of 'surah_detail_bloc.dart';

abstract class SurahDetailState extends Equatable {
  const SurahDetailState();

  @override
  List<Object> get props => [];
}

class SurahDetailInitial extends SurahDetailState {}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailSucces extends SurahDetailState {
  final SurahModel surahDetail;
  // final SurahModel surahDetail;

  const SurahDetailSucces(this.surahDetail);

  @override
  List<Object> get props => [surahDetail];
}

class SurahDetailFailed extends SurahDetailState {}

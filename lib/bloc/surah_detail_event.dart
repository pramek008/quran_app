part of 'surah_detail_bloc.dart';

abstract class SurahDetailEvent extends Equatable {
  const SurahDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadDetailSurahEvent extends SurahDetailEvent {
  final int surahNumber;

  const LoadDetailSurahEvent({required this.surahNumber});
  @override
  List<Object> get props => [surahNumber];
}

class NoInternetDetailSurahEvent extends SurahDetailEvent {
  @override
  List<Object> get props => [];
}

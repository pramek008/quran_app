part of 'all_surah_bloc.dart';

abstract class AllSurahState extends Equatable {
  const AllSurahState();

  @override
  List<Object> get props => [];
}

class AllSurahInitial extends AllSurahState {}

class AllSurahLoading extends AllSurahState {}

class AllSurahSucces extends AllSurahState {
  final List<AllSurahModel> surahList;

  const AllSurahSucces(this.surahList);

  @override
  List<Object> get props => [surahList];
}

class AllSurahError extends AllSurahState {
  // final String error;

  // const AllSurahError({required this.error});

  // @override
  // List<Object> get props => [error];
}

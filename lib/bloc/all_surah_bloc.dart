import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/model/getall_surah_model.dart';
import 'package:quran_app/services/surah_service.dart';

part 'all_surah_event.dart';
part 'all_surah_state.dart';

class AllSurahBloc extends Bloc<AllSurahEvent, AllSurahState> {
  AllSurahBloc() : super(AllSurahInitial()) {
    on<LoadApiEvent>(
      (event, emit) async {
        try {
          emit(AllSurahLoading());
          List<AllSurahModel> allSurah = await SurahService().getAllSurah();

          emit(AllSurahSucces(allSurah));
        } on Exception catch (e) {
          throw Exception(e.toString());
        }
      },
    );

    on<NoInternetEvent>((event, emit) {
      emit(AllSurahFailed());
    });
  }
}

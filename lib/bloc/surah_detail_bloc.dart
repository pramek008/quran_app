import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/services/surah_service.dart';

part 'surah_detail_event.dart';
part 'surah_detail_state.dart';

class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  SurahDetailBloc() : super(SurahDetailInitial()) {
    on<LoadDetailSurahEvent>((event, emit) async {
      try {
        emit(SurahDetailLoading());
        // List<SurahModel> surahDetail =
        SurahModel surahDetail =
            await SurahService().getSurahDetail(event.surahNumber);
        emit(SurahDetailSucces(surahDetail));
      } on Exception catch (e) {
        Exception(e.toString());
      }
    });

    on<NoInternetDetailSurahEvent>((event, emit) {
      emit(SurahDetailFailed());
    });
  }
}

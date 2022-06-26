import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/model/getall_surah_model.dart';
import 'package:quran_app/services/connectivity_service.dart';
import 'package:quran_app/services/surah_service.dart';

part 'all_surah_event.dart';
part 'all_surah_state.dart';

class AllSurahBloc extends Bloc<AllSurahEvent, AllSurahState> {
  final SurahService _surahService;
  final ConnectivityService _connectivityService;
  AllSurahBloc(this._surahService, this._connectivityService)
      : super(AllSurahInitial()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('no internet');
        add(NoInternetEvent());
      } else {
        print('has internet');
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>(
      (event, emit) async {
        try {
          emit(AllSurahLoading());
          List<AllSurahModel> allSurah = await _surahService.getAllSurah();

          emit(AllSurahSucces(allSurah));
        } on Exception catch (e) {
          throw Exception(e.toString());
        }
      },
    );

    on<NoInternetEvent>((event, emit) {
      emit(NoInternetState());
    });
  }
}

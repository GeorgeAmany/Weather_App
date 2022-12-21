import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';
import 'states.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit getObject(context) => BlocProvider.of(context);

  WeatherAppData? model;

  Future<void> getWeatherDetails() async {
    emit(GetWeatherLoadingState());
    final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather?q=mansoura&appid=509dc5d730ff2dd6003b22f30ae93313');
    if (response.statusCode != 500 && response.statusCode != 404) {
      emit(GetWeatherSuccessState());
      model = WeatherAppData.fromJson(response.data);
    } else {
      emit(GetWeatherFailedState());
    }
  }
}

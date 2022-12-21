import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'states.dart';


class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(builder: (context) {
        final cubit = WeatherCubit.getObject(context);
        cubit.getWeatherDetails();

        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Weather App'),
            centerTitle: true,
            elevation: 0,
          ),
          body: SizedBox(
            height: 800,
            width: double.infinity,
            child: Stack(
              children: [
                const Image(
                  fit: BoxFit.fitHeight,
                  height: 800,
                  width: double.infinity,
                  image: NetworkImage(
                    'https://i.pinimg.com/736x/b1/ec/43/b1ec430ab76b54a6025055f94f6d7ec9.jpg',
                  ),
                ),
                BlocBuilder<WeatherCubit ,WeatherStates>(
                  builder: (context, state) {
                    if (state is GetWeatherFailedState){
                      return const CircularProgressIndicator();
                    }
                    return Center(
                      child: SizedBox(
                        height: 700,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(cubit.model!.name,
                                style: const TextStyle(
                                    color: Colors.amber, fontSize: 30),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                " Wind Speed : ${cubit.model!.wind.speed.toString()}",
                                style: const TextStyle(
                                    color: Colors.amber, fontSize: 30),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Max Temperature : ${cubit.model!.main.tempMax.toString()}",
                                style: const TextStyle(
                                    color: Colors.amber, fontSize: 30),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Min Temperature : ${cubit.model!.main.tempMin.toString()}",
                                style: const TextStyle(
                                    color: Colors.amber, fontSize: 30),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Description : ${cubit.model!.weather[0].description.toString()}",
                                style: const TextStyle(
                                    color: Colors.amber, fontSize: 30),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                "The sky is an infinite movie to me. I never get tired of looking at what's happening up there.",
                                style: TextStyle(color: Colors.white, fontSize: 30),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Weather'),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: Dio().get(
            'https://api.openweathermap.org/data/2.5/weather?q=mansoura&appid=509dc5d730ff2dd6003b22f30ae93313'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final model = WeatherData.fromJson(snapshot.data!.data);

            return SizedBox(
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
                  Center(
                    child: SizedBox(
                      height: 700,
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(model.name,
                              style:
                                  const TextStyle(color: Colors.amber, fontSize: 30),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(" Wind Speed : ${model.wind.speed.toString()}",
                              style:
                                  const TextStyle(color: Colors.amber, fontSize: 30),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Max Temperature : ${model.main.tempMax.toString()}",
                              style:
                                  const TextStyle(color: Colors.amber, fontSize: 30),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Min Temperature : ${model.main.tempMin.toString()}",
                              style:
                                  const TextStyle(color: Colors.amber, fontSize: 30),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Description : ${model.weather[0].description.toString()}",
                              style:
                                  const TextStyle(color: Colors.amber, fontSize: 30),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              "The sky is an infinite movie to me. I never get tired of looking at what's happening up there.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 40,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );

          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

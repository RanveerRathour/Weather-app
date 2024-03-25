import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../list_of_locations/cubit/list_of_locations_cubit.dart';
import '../../notifier/weather/bloc/weather_bloc.dart';
import '../widget/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherBloc weatherBloc = WeatherBloc();
  @override
  void initState() {
    weatherBloc.add(FetchWeather());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      builder: (BuildContext context, WeatherState state) {
        if (state is WeatherInitial || state is WeatherLoading) {
          return SafeArea(
            child: Container(
              height: double.maxFinite,
              width: double.minPositive,
              color: Colors.black,
              child: Lottie.asset(
                'assets/lottie_animation/samsungLoading.json',
                repeat: true,
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          );
        }

        if (state is WeatherSuccess) {
          BlocProvider.of<ListOfLocationsCubit>(context).addLocations(
            newLocations: state.temperature,
            isCurrentLocation: true,
          );
          return WeatherWidget(
            temperatures: state.temperature,
          );
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Something went wrong!',
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Lottie.asset(
                  'assets/lottie_animation/no_internet.json', //'assets/lottie_animation/loading_hand.json',
                  repeat: true,
                  fit: BoxFit.contain,
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                ElevatedButton(
                  onPressed: () {
                    weatherBloc.add(FetchWeather());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'Try Again!',
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

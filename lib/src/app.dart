import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/list_of_locations/cubit/list_of_locations_cubit.dart';
import 'features/search/notifier/cubit/fetch_selected_weather_cubit.dart';
import 'features/search/notifier/cubit/searched_list_cubit.dart';
import 'features/search/ui/view/search_view.dart';
import 'features/settings/ui/view/manage_locations_view.dart';
import 'features/settings/ui/view/setting_view.dart';
import 'features/settings/ui/view/unit_view.dart';
import 'features/weather_home_page/notifier/weather/bloc/weather_bloc.dart';
import 'features/weather_home_page/ui/view/home_page.dart';

/// The Widget that configures your application.
class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<WeatherBloc>(
            create: (_) => WeatherBloc(),
          ),
          BlocProvider<SearchedListCubit>(
            create: (_) => SearchedListCubit(),
          ),
          BlocProvider<ListOfLocationsCubit>(
            create: (_) => ListOfLocationsCubit(),
          ),
          BlocProvider<FetchSelectedWeatherCubit>(
            create: (_) => FetchSelectedWeatherCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: const <Locale>[
          //   Locale('en', ''), // English, no country code
          // ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          // onGenerateTitle: (BuildContext context) =>
          //     AppLocalizations.of(context)!.appTitle,
          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  // case SettingsView.routeName:
                  //   return SettingsView(controller: settingsController);

                  case SettingsView.routeName:
                    return const SettingsView();
                  case UnitView.routeName:
                    return const UnitView();
                  case ManageLocationView.routeName:
                    return const ManageLocationView();
                  case SearchView.routeName:
                    return const SearchView();
                  case HomePage.routeName:
                  default:
                    return const HomePage();
                }
              },
            );
          },
        ),
      ),
    );
  }
}

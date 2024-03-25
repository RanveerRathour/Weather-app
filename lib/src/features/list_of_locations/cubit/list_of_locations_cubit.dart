import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../weather_home_page/models/temperatures_model.dart';
part 'list_of_locations_state.dart';

class ListOfLocationsCubit extends Cubit<ListOfLocationsState> {
  ListOfLocationsCubit() : super(const ListOfLocation());
  final List<Temperatures> locations = <Temperatures>[];

  void addLocations({
    required Temperatures newLocations,
    bool isCurrentLocation = false,
  }) {
    emit(
      const ListOfLocation().copyWith(
        isLoading: true,
      ),
    );

    bool isElementExist = false;

    for (final Temperatures element in locations) {
      if (element.location?.lat == newLocations.location?.lat &&
          element.location?.lon == newLocations.location?.lon) {
        isElementExist = true;
        break;
      }
    }

    if (!isElementExist) {
      isCurrentLocation
          ? locations.insert(0, newLocations)
          : locations.add(newLocations);
    }

    emit(
      const ListOfLocation().copyWith(
        isLoading: false,
        listOfLocations: locations,
      ),
    );
  }
}

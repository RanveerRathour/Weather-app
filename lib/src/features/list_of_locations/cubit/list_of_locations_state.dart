part of 'list_of_locations_cubit.dart';

sealed class ListOfLocationsState extends Equatable {
  const ListOfLocationsState();

  @override
  List<Object> get props => <Object>[];
}

// final class ListOfLocationsInitialState extends ListOfLocationsState {}

final class ListOfLocation extends ListOfLocationsState {
  const ListOfLocation({
    this.isLoading = false,
    this.isError = false,
    this.listOfLocations = const <Temperatures>[],
  });

  final bool isLoading;
  final bool isError;
  final List<Temperatures> listOfLocations;

  @override
  List<Object> get props => <Object>[
        listOfLocations,
        isLoading,
        isError,
      ];

  ListOfLocation copyWith({
    bool? isLoading,
    bool? isError,
    List<Temperatures>? listOfLocations,
  }) {
    return ListOfLocation(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      listOfLocations: listOfLocations ?? this.listOfLocations,
    );
  }
}

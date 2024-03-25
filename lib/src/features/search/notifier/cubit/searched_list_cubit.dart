import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../utilities/debouncer.dart';
import '../../../weather_home_page/models/location_model.dart';
import '../../repository/search_location_repository.dart';
part 'searched_list_state.dart';

class SearchedListCubit extends Cubit<SearchedListState> {
  SearchedListCubit() : super(SearchedListInitialState());

  final Debouncer _debouncer = Debouncer(delay: 500);

  void updateSearchedList({required String value}) async {
    if (value.isEmpty) {
      emit(SearcheItemEmptyState());
      return;
    }

    emit(SearchedListLoadingState());
    _debouncer.run(() async {
      final List<Location>? searchedList =
          await SearchLocationRepository().fetchWeatherRepo(name: value);
      if (searchedList != null && searchedList.isNotEmpty) {
        emit(SearchedListSuccessState(searchedList: searchedList));
        return;
      } else if (searchedList == null) {
        emit(SearchedListFailedState());
        return;
      } else {
        emit(SearchedListEmptyState());
        return;
      }
    });
  }
}

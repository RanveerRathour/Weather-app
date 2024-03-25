part of 'searched_list_cubit.dart';

sealed class SearchedListState extends Equatable {
  const SearchedListState();

  @override
  List<Object> get props => <Object>[];
}

final class SearchedListInitialState extends SearchedListState {}

final class SearcheItemEmptyState extends SearchedListState {}

final class SearchedListLoadingState extends SearchedListState {}

final class SearchedListEmptyState extends SearchedListState {}

final class SearchedListFailedState extends SearchedListState {}

final class SearchedListSuccessState extends SearchedListState {
  const SearchedListSuccessState({required this.searchedList});

  final List<Location> searchedList;
}

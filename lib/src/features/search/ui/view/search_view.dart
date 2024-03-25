import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../list_of_locations/cubit/list_of_locations_cubit.dart';
import '../../../weather_home_page/models/location_model.dart';
import '../../../weather_home_page/models/temperatures_model.dart';
import '../../notifier/cubit/fetch_selected_weather_cubit.dart';
import '../../notifier/cubit/searched_list_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  static const String routeName = '/Search';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<bool> _showSearchIcon = ValueNotifier<bool>(true);
  final FocusNode _focusNode = FocusNode();
  List<Location> _locations = <Location>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          centerTitle: false,
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.chevron_left_outlined,
              size: 32.sp,
              color: Colors.white,
            ),
            onPressed: () async {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
          actions: <Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: _showSearchIcon,
              builder: (_, bool show, ___) {
                return (_controller.text.isEmpty)
                    ? IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 28.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    : IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.clear_outlined,
                          size: 32.sp,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          _controller.text = '';
                          BlocProvider.of<SearchedListCubit>(context)
                              .updateSearchedList(value: '');
                          _showSearchIcon.value = true;
                        },
                      );
              },
            ),
          ],
          title: TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              overflow: TextOverflow.ellipsis,
            ),
            onChanged: (String value) {
              if (value.isEmpty) {
                _showSearchIcon.value = true;
              } else {
                _showSearchIcon.value = false;
                BlocProvider.of<SearchedListCubit>(context)
                    .updateSearchedList(value: value);
              }
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.white54,
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis,
                height: 0,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 24.sp,
            right: 24.sp,
            top: 12.sp,
            bottom: 8.sp,
          ),
          child: BlocBuilder<SearchedListCubit, SearchedListState>(
            builder: (_, SearchedListState state) {
              if (_controller.text.isEmpty ||
                  state is SearchedListInitialState) {
                return Center(
                  child: Text(
                    'Enter a location name.',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 20.sp,
                      overflow: TextOverflow.ellipsis,
                      height: 0,
                    ),
                  ),
                );
              }
              if (state is SearchedListEmptyState ||
                  state is SearchedListFailedState) {
                return Center(
                  child: Text(
                    'No results found.',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 20.sp,
                      overflow: TextOverflow.ellipsis,
                      height: 0,
                    ),
                  ),
                );
              }
              if (state is SearchedListSuccessState) {
                _locations = state.searchedList;
                return Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _locations.length,
                    separatorBuilder: (_, __) {
                      return const Divider(
                        thickness: 1,
                        color: Colors.white54,
                      );
                    },
                    itemBuilder: (_, int index) {
                      return InkWell(
                        borderRadius: (_locations.length == 1)
                            ? BorderRadius.all(
                                Radius.circular(12.sp),
                              )
                            : BorderRadius.vertical(
                                top: (index == 0)
                                    ? Radius.circular(20.sp)
                                    : Radius.zero,
                                bottom: (index == _locations.length - 1)
                                    ? Radius.circular(20.sp)
                                    : Radius.zero,
                              ),
                        onTap: () async {
                          final Temperatures? temp =
                              await BlocProvider.of<FetchSelectedWeatherCubit>(
                            context,
                          ).fetchWeather(location: _locations[index]);
                          if (temp != null && mounted) {
                            BlocProvider.of<ListOfLocationsCubit>(context)
                                .addLocations(newLocations: temp);
                          }
                          if (mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                _locations[index].name ?? 'NA',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Text(
                                '${_locations[index].region ?? _locations[index].name ?? 'NA'}, ${_locations[index].country ?? ''}',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

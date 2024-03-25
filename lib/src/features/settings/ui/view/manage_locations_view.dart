import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../list_of_locations/cubit/list_of_locations_cubit.dart';
import '../../../search/notifier/cubit/fetch_selected_weather_cubit.dart';
import '../../../search/ui/view/search_view.dart';

class ManageLocationView extends StatefulWidget {
  const ManageLocationView({super.key});

  static const String routeName = '/manage_locations';

  @override
  State<ManageLocationView> createState() => _ManageLocationViewState();
}

class _ManageLocationViewState extends State<ManageLocationView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 4.sp,
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
          title: Text(
            'Manage Locations',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              overflow: TextOverflow.ellipsis,
              height: 0,
            ),
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.add,
                size: 32.sp,
                color: Colors.white,
              ),
              onPressed: () async {
                Navigator.pushNamed(context, SearchView.routeName);
              },
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.more_vert_outlined,
                size: 32.sp,
                color: Colors.white,
              ),
              onPressed: () async {},
            ),
          ],
        ),
        body: BlocBuilder<FetchSelectedWeatherCubit, FetchSelectedWeatherState>(
          builder: (BuildContext context, FetchSelectedWeatherState state) {
            if (state is FetchSelectedWeatherLoadingState) {
              return Center(
                child: SizedBox(
                  height: 100.sp,
                  width: 100.sp,
                  child: Lottie.asset(
                    'assets/lottie_animation/samsungLoading.json',
                    repeat: true,
                    fit: BoxFit.scaleDown,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            }
            return BlocBuilder<ListOfLocationsCubit, ListOfLocationsState>(
              builder: (_, ListOfLocationsState state) {
                if (state is ListOfLocation &&
                    !state.isLoading &&
                    state.listOfLocations.isNotEmpty) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.sp,
                      vertical: 12.sp,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.sp,
                          ),
                          child: Text(
                            'Current location',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 18.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.sp,
                            vertical: 8.sp,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(16.sp),
                          ),
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                state.listOfLocations
                                        .toList()[0]
                                        .location
                                        ?.name ??
                                    'NA',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '${state.listOfLocations.toList()[0].location?.region ?? state.listOfLocations.toList()[0].location?.name ?? 'NA'}, ${state.listOfLocations.toList()[0].location?.country ?? ''}',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 16.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        if (state.listOfLocations.length > 1)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.sp,
                            ),
                            child: Text(
                              'Other locations',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.listOfLocations.length,
                          separatorBuilder: (_, int index) {
                            if (index == 0) {
                              return const SizedBox.shrink();
                            }
                            return SizedBox(
                              height: 12.sp,
                            );
                          },
                          itemBuilder: (_, int index) {
                            if (index == 0) {
                              return const SizedBox.shrink();
                            }
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.sp,
                                vertical: 8.sp,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    state.listOfLocations
                                            .toList()[index]
                                            .location
                                            ?.name ??
                                        'NA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '${state.listOfLocations.toList()[index].location?.region ?? state.listOfLocations.toList()[index].location?.name ?? 'NA'}, ${state.listOfLocations.toList()[index].location?.country ?? ''}',
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 16.sp,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is ListOfLocation && state.isLoading) {
                  return Center(
                    child: SizedBox(
                      height: 100.sp,
                      width: 100.sp,
                      child: Lottie.asset(
                        'assets/lottie_animation/samsungLoading.json',
                        repeat: true,
                        fit: BoxFit.scaleDown,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  );
                }

                // this will execute only when list is empty...
                return const SizedBox.shrink();

                // TODO handle error state.
              },
            );
          },
        ),
      ),
    );
  }
}

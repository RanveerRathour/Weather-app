import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../../../../utilities/horizontal_dotted_line_widget.dart';
import '../../../list_of_locations/cubit/list_of_locations_cubit.dart';
import '../../../settings/ui/view/manage_locations_view.dart';
import '../../../settings/ui/view/setting_view.dart';
import '../../models/temperatures_model.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key, required this.temperatures});
  final Temperatures temperatures;
  final Box<bool> box = Hive.box('scaleIsDegree');
  @override
  Widget build(BuildContext context) {
    final bool tabValue = box.get('scaleIsDegree', defaultValue: true) ?? true;
    const String degreeSymbol = '\u00B0';
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 24.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                alignment: Alignment.topRight,
                padding: EdgeInsets.zero,
                icon: Icon(
                  CupertinoIcons.gear,
                  size: 28.sp,
                  color: Colors.white,
                ),
                onPressed: () async {
                  Navigator.popAndPushNamed(context, SettingsView.routeName);
                },
              ),
            ),
            SizedBox(
              height: 24.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.sp, right: 4.sp),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on_outlined,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12.sp,
                  ),
                  Text(
                    'Current Location',
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        overflow: TextOverflow.ellipsis,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 44.sp,
                right: 4.sp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    temperatures.location?.name ?? 'NA',
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        height: 0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                        'https:${temperatures.current!.condition!.icon!}',
                        height: 24.sp,
                        width: 24.sp,
                        color: Colors.white,
                        errorBuilder: (_, Object error, __) {
                          log(error.toString());
                          return const SizedBox.shrink();
                        },
                      ),
                      Text(
                        tabValue
                            ? '${temperatures.current?.temp_c.toString() ?? 'NA'}$degreeSymbol'
                            : '${temperatures.current?.temp_f.toString() ?? 'NA'}$degreeSymbol',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            overflow: TextOverflow.ellipsis,
                            height: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.sp,
            ),
            const HorizontalDottedLine(
              thickness: 2.0,
              lineLength: 2000.0,
              color: Colors.white,
              dashWidth: 0.5,
              dashSpacing: 6.0,
            ),
            SizedBox(
              height: 24.sp,
            ),
            InkWell(
              onTap: () async {
                Navigator.popAndPushNamed(
                  context,
                  ManageLocationView.routeName,
                );
              },
              borderRadius: BorderRadius.circular(8.sp),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 8.sp,
                  right: 4.sp,
                  top: 4.sp,
                  bottom: 4.sp,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_location_alt_outlined,
                      size: 24.sp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12.sp,
                    ),
                    Text(
                      'Other Locations',
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          overflow: TextOverflow.ellipsis,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            BlocBuilder<ListOfLocationsCubit, ListOfLocationsState>(
              builder: (_, ListOfLocationsState state) {
                if (state is ListOfLocation &&
                    !state.isLoading &&
                    state.listOfLocations.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.listOfLocations.map((Temperatures element) {
                      return Column(
                        children: <Widget>[
                          if (temperatures.location?.lat !=
                                  element.location?.lat &&
                              temperatures.location?.lon !=
                                  element.location?.lon)
                            if (element.location != null)
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 44.sp,
                                  right: 4.sp,
                                  bottom: 20.sp,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      element.location?.name ?? 'NA',
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.network(
                                          'https:${element.current!.condition!.icon!}',
                                          height: 24.sp,
                                          width: 24.sp,
                                          color: Colors.white,
                                          errorBuilder: (_, Object error, __) {
                                            log(error.toString());
                                            return const SizedBox.shrink();
                                          },
                                        ),
                                        Text(
                                          tabValue
                                              ? '${element.current?.temp_c.toString() ?? 'NA'}$degreeSymbol'
                                              : '${element.current?.temp_f.toString() ?? 'NA'}$degreeSymbol',
                                          style: GoogleFonts.quicksand(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              overflow: TextOverflow.ellipsis,
                                              height: 0.8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      );
                    }).toList(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            InkWell(
              onTap: () async {
                Navigator.popAndPushNamed(
                  context,
                  ManageLocationView.routeName,
                );
              },
              borderRadius: BorderRadius.circular(50.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                padding: EdgeInsets.all(8.sp),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Manage locations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
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
  }
}

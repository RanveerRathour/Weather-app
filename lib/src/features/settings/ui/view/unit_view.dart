import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import '../../constant/settings_constant.dart';

class UnitView extends StatefulWidget {
  const UnitView({super.key});

  static const String routeName = '/units';

  @override
  State<UnitView> createState() => _UnitViewState();
}

class _UnitViewState extends State<UnitView> {
  final ValueNotifier<Unit> unitNotifier = ValueNotifier<Unit>(Unit.metric);
  final ValueNotifier<WindDirection> windDirectionNotifier =
      ValueNotifier<WindDirection>(WindDirection.cardinal);
  final Box<Unit> unitBox = Hive.box('Unit');
  final Box<bool> box = Hive.box('scaleIsDegree');
  final Box<WindDirection> windDirectionBox = Hive.box('WindDirection');

  @override
  void initState() {
    super.initState();
    unitNotifier.value =
        unitBox.get('unit', defaultValue: Unit.metric) ?? Unit.metric;
    windDirectionNotifier.value = windDirectionBox.get(
          'windDirection',
          defaultValue: WindDirection.cardinal,
        ) ??
        WindDirection.cardinal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 4.sp,
        title: Text(
          'Units',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            overflow: TextOverflow.ellipsis,
            height: 0,
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.chevron_left_outlined,
            size: 32.sp,
            color: Colors.white,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 32.sp,
            ),
            Text(
              'Unit',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis,
                height: 0,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            ValueListenableBuilder<Unit>(
              valueListenable: unitNotifier,
              builder: (_, Unit unit, __) {
                return SegmentedButton<Unit>(
                  showSelectedIcon: false,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors
                              .white30; // Change to the color you want for the selected button
                        } else {
                          return Colors.transparent;
                        }
                      },
                    ),
                    // foregroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.white12),
                    enableFeedback: true,
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 12.sp,
                        horizontal: 12.sp,
                      ),
                    ),
                  ),
                  segments: <ButtonSegment<Unit>>[
                    ButtonSegment<Unit>(
                      value: Unit.imperial,
                      label: Column(
                        children: <Widget>[
                          Text(
                            '\u2109, mph, in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Text(
                            'Imperial',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonSegment<Unit>(
                      value: Unit.metric,
                      label: Column(
                        children: <Widget>[
                          Text(
                            '\u2103, Km/h, mm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Text(
                            'Metric',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonSegment<Unit>(
                      value: Unit.hybrid,
                      label: Column(
                        children: <Widget>[
                          Text(
                            '\u2103, mph, mm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Text(
                            'Hybrid',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.sp,
                              overflow: TextOverflow.fade,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  selected: <Unit>{unit},
                  onSelectionChanged: (Set<Unit> newSelection) async {
                    unitNotifier.value = newSelection.first;
                    unitBox.put('unit', newSelection.first);
                    if (newSelection.first == Unit.metric ||
                        newSelection.first == Unit.hybrid) {
                      box.put('scaleIsDegree', true);
                    } else {
                      box.put('scaleIsDegree', false);
                    }
                    HapticFeedback.heavyImpact();
                  },
                );
              },
            ),

            //wind direction

            SizedBox(
              height: 32.sp,
            ),
            Text(
              'WIND DIRECTION',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 20.sp,
                overflow: TextOverflow.ellipsis,
                height: 0,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            ValueListenableBuilder<WindDirection>(
              valueListenable: windDirectionNotifier,
              builder: (_, WindDirection windDirection, __) {
                return SegmentedButton<WindDirection>(
                  showSelectedIcon: false,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors
                              .white30; // Change to the color you want for the selected button
                        } else {
                          return Colors.transparent;
                        }
                      },
                    ),
                    // foregroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.white12),
                    enableFeedback: true,
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 12.sp,
                        horizontal: 58.sp,
                      ),
                    ),
                  ),
                  segments: <ButtonSegment<WindDirection>>[
                    ButtonSegment<WindDirection>(
                      value: WindDirection.cardinal,
                      label: Column(
                        children: <Widget>[
                          Text(
                            'N, S, E, W',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Text(
                            'Cardinal',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonSegment<WindDirection>(
                      value: WindDirection.degrees,
                      label: Column(
                        children: <Widget>[
                          Text(
                            '0\u00B0 - 360\u00B0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Text(
                            'Degree',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  selected: <WindDirection>{windDirection},
                  onSelectionChanged: (Set<WindDirection> newSelection) async {
                    windDirectionNotifier.value = newSelection.first;
                    windDirectionBox.put('windDirection', newSelection.first);
                    HapticFeedback.heavyImpact();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

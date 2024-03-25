import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart';

import 'unit_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  static const String routeName = '/settings';

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  ValueNotifier<bool> switchNotifier = ValueNotifier<bool>(false);
  final Box<bool> alertSwitchBox = Hive.box('Alerts');

  @override
  void initState() {
    super.initState();
    switchNotifier.value =
        alertSwitchBox.get('alert', defaultValue: false) ?? false;
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
          'Weather settings',
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
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 24.sp,
          right: 24.sp,
          top: 12.sp,
          bottom: 8.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'General',
              style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.sp),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(context, UnitView.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.square_foot_outlined,
                                color: Colors.white,
                                size: 24.sp,
                              ),
                              SizedBox(
                                width: 4.sp,
                              ),
                              Text(
                                'Unit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Colors.white,
                            size: 28.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white54,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.crisis_alert_outlined,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  width: 4.sp,
                                ),
                                Text(
                                  'Alerts',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.sp,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.sp),
                              child: Text(
                                'warnings issued by government\nagencies',
                                maxLines: 2,
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12.sp,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              color: Colors.white54,
                              width: 1.sp,
                              height: 24.sp,
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            ValueListenableBuilder<bool>(
                              valueListenable: switchNotifier,
                              builder: (_, bool switchValue, __) {
                                return CupertinoSwitch(
                                  activeColor: CupertinoColors.activeBlue,
                                  value: switchValue,
                                  onChanged: (bool? value) async {
                                    switchNotifier.value = value!;
                                    alertSwitchBox.put('alert', value);
                                    HapticFeedback.heavyImpact();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            Text(
              'Others',
              style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            Container(
              padding: EdgeInsets.all(12.sp),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.info_circle,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.sp,
                  ),
                  Text(
                    'About Weather App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

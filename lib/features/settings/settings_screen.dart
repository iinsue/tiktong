import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/common/widgets/video_configuration/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  Future<void> _showDatePicker() async {
    try {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2030),
        locale: const Locale('ko', 'KR'),
      );
      if (date != null && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('선택된 날짜: ${date.toString()}')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('날짜 선택 중 오류가 발생했습니다: $e')));
      }
    }
  }

  Future<void> _showTimePicker() async {
    try {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('선택된 시간: ${time.format(context)}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('시간 선택 중 오류가 발생했습니다: $e')));
      }
    }
  }

  Future<void> _showDateRangePicker() async {
    try {
      final booking = await showDateRangePicker(
        context: context,
        firstDate: DateTime(1980),
        lastDate: DateTime(2030),
        locale: const Locale('ko', 'KR'),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.amberAccent,
                onPrimary: Colors.redAccent,
                onSurface: Colors.blueAccent,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
            ),
            child: child!,
          );
        },
      );
      if (booking != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '선택된 기간: ${booking.start.toString()} ~ ${booking.end.toString()}',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('기간 선택 중 오류가 발생했습니다: $e')));
      }
    }
  }

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale('ko', 'KR'),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Settings")),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              value: VideoConfigData.of(context).autoMute,
              onChanged: (value) {
                VideoConfigData.of(context).toggleMuted();
              },
              title: Text("Auto Mute videos"),
              subtitle: Text("Enable notifications"),
            ),

            CheckboxListTile(
              activeColor: Colors.black,
              value: _notifications,
              onChanged: _onNotificationsChanged,
              title: Text("Videos will be muted by default."),
            ),

            ListTile(
              onTap: () async {
                await _showDatePicker();
                await _showTimePicker();
                await _showDateRangePicker();
              },
              title: Text("What is your birthday?"),
            ),

            ListTile(
              title: Text("Log out (iOS)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder:
                      (context) => CupertinoAlertDialog(
                        title: Text("Are you sure?"),
                        content: Text("Plz dont go"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("No"),
                          ),
                          CupertinoDialogAction(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                );
              },
            ),

            ListTile(
              title: Text("Log out (Android)"),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text("Are you sure?"),
                        content: Text("Plz dont go"),
                        actions: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: FaIcon(FontAwesomeIcons.car),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                );
              },
            ),

            ListTile(
              title: Text("Log out (iOS / Bottom)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder:
                      (context) => CupertinoActionSheet(
                        title: Text("Are you sure?"),
                        message: Text("Please dont go"),
                        actions: [
                          CupertinoActionSheetAction(
                            isDefaultAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              "Not log out",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Yes plz."),
                          ),
                        ],
                      ),
                );
              },
            ),

            AboutListTile(
              applicationName: "TikTong",
              applicationVersion: "1.0",
              applicationLegalese: "Don't copy me.",
            ),
          ],
        ),
      ),
    );
  }
}

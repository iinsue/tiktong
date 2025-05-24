import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktong/features/authentication/repositories/authentication_repo.dart';
import 'package:tiktong/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> datePicker() async {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2030),
        locale: const Locale('ko', 'KR'),
      );

      if (kDebugMode) {
        print(date);
      }
    }

    Future<void> timePicker() async {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (kDebugMode) {
        print(time);
      }
    }

    Future<void> dateRangePicker() async {
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
      if (kDebugMode) {
        print(booking);
      }
    }

    return Localizations.override(
      context: context,
      locale: const Locale('ko', 'KR'),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Settings")),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              value: ref.watch(playbackConfigProvider).muted,
              onChanged:
                  (value) => {
                    ref.read(playbackConfigProvider.notifier).setMuted(value),
                  },
              title: Text("Muted video"),
              subtitle: Text("Video will be muted by default."),
            ),

            SwitchListTile.adaptive(
              value: ref.watch(playbackConfigProvider).autoplay,
              onChanged:
                  (value) => {
                    ref.read(playbackConfigProvider.notifier).setAutplay(value),
                  },
              title: Text("Autoplay"),
              subtitle: Text("Video will start playing automatically."),
            ),

            SwitchListTile.adaptive(
              value: false,
              onChanged: (value) {},
              title: Text("Auto Mute videos"),
              subtitle: Text("Enable notifications"),
            ),

            CheckboxListTile(
              activeColor: Colors.black,
              value: false,
              onChanged: (value) {},
              title: Text("Videos will be muted by default."),
            ),

            ListTile(
              onTap: () async {
                await datePicker();
                await timePicker();
                await dateRangePicker();
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
                            onPressed: () {
                              ref.read(authRepo).signOut();
                              context.go("/");
                            },
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

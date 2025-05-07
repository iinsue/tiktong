import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _showDatePicker() async {
    try {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2030),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            onTap: () async {
              await _showDatePicker();
              await _showTimePicker();
              await _showDateRangePicker();
            },
            title: Text("What is your birthday?"),
          ),
          AboutListTile(applicationName: "TikTong"),
        ],
      ),
    );
  }
}

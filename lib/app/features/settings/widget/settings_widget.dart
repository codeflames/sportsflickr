import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class EmailSubject extends Equatable {
  final String subject;
  final Color color;

  const EmailSubject({required this.subject, required this.color});

  @override
  List<Object?> get props => [subject, color];

  EmailSubject copyWith({
    String? subject,
    Color? color,
  }) {
    return EmailSubject(
      subject: subject ?? this.subject,
      color: color ?? this.color,
    );
  }
}

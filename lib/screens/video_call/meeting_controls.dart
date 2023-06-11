import 'package:avukapp/constant/constant.dart';
import 'package:flutter/material.dart';

class MeetingControls extends StatelessWidget {
  final void Function() onToggleMicButtonPressed;
  final void Function() onToggleCameraButtonPressed;
  final void Function() onLeaveButtonPressed;

  const MeetingControls(
      {super.key,
      required this.onToggleMicButtonPressed,
      required this.onToggleCameraButtonPressed,
      required this.onLeaveButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kNavyBlueColor),
            onPressed: onLeaveButtonPressed,
            child: const Text('Çıkış')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kNavyBlueColor),
            onPressed: onToggleMicButtonPressed,
            child: const Text('Mikrofonu kapat')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kNavyBlueColor),
            onPressed: onToggleCameraButtonPressed,
            child: const Text('Kamerayı kapat')),
      ],
    );
  }
}

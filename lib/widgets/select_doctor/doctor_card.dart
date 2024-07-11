import 'package:click_desk/models/doctor_state/doctor_state.dart';
import 'package:click_desk/providers/checkin/checkin_provider.dart';
import 'package:click_desk/routes/nav.dart';
import 'package:click_desk/widgets/chip_widget.dart';
import 'package:click_desk/widgets/dialogs/base_alert_dialog.dart';
import 'package:click_desk/widgets/spacer.dart';
import 'package:click_desk/widgets/texts/base_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DoctorCard extends ConsumerWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
  });

  final DoctorState doctor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        if (!doctor.isWorking) {
          baseAlertDialog(context, "해당 진료실은 현재 자리비움 상태 입니다.");
          return;
        }

        ref.read(checkinProvider.notifier).setDoctor(doctor);

        if (context.mounted) Nav.of(context).pushSelectReason();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 1,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                BaseText(doctor.jinchalName,
                    fontSize: 28, bold: true, color: Colors.blue),
                ChipWidget(
                    text: doctor.isWorking ? "진료가능" : "자리비움",
                    color: doctor.isWorking ? Colors.green : Colors.grey),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[200],
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.person_2_outlined),
                ),
                const WidthSpacer(18.0),
                Container(
                  constraints: const BoxConstraints(minWidth: 120),
                  child: BaseText(
                    doctor.name,
                    fontSize: 24,
                    color: Colors.blueGrey,
                    bold: true,
                  ),
                ),
                const WidthSpacer(),
                BaseText(
                  doctor.kwamokName,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
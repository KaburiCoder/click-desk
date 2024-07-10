import 'package:click_desk/constants/lottie_paths.dart';
import 'package:click_desk/models/checkin_state/checkin_state.dart';
import 'package:click_desk/providers/checkin/checkin_provider.dart';
import 'package:click_desk/widgets/common_left_body.dart';
import 'package:click_desk/widgets/left_wrapper.dart';
import 'package:click_desk/widgets/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/cert/verification_selections.dart';

class CertPage extends HookConsumerWidget {
  const CertPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(checkinProvider);
    useEffect(() {
      Future(() {
        ref.read(checkinProvider.notifier).setStartType(StartType.followUp);
      });
      return null;
    }, []);

    return Row(
      children: [
        LeftWrapper(
          backgroundColor: Colors.amber,
          navButtonColor: Colors.orange,
          bodyWidget: CommonLeftBody(
            title1: "본인확인수단을",
            title2: "선택하세요.",
            bodyWidget: Align(
              alignment: Alignment.centerRight,
              child: LottieAnimation(
                LottiePaths.cert,
                duration: 2000,
              ),
            ),
          ),
        ),
        const VerificationSelections()
      ],
    );
  }
}

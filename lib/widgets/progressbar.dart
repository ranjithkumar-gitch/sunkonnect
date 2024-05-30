import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';


class ProgressBarHUD extends StatelessWidget {
  const ProgressBarHUD({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SizedBox(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.white,
            ),
          ),
          Center(
            child: SpinKitSpinningLines(
              itemCount: 5,
              color: Colours.kbuttonpurple,
              lineWidth: 5,
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}

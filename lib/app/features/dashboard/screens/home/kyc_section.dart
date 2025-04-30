import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/widgets/bg/svg_bg.dart';
import 'package:realize_mobile_app/app/widgets/buttons/white_button.dart';

class KYCSection extends StatelessWidget {
  final bool isKYCVerified;
  final VoidCallback verifyKYC;

  const KYCSection({
    Key? key,
    required this.isKYCVerified,
    required this.verifyKYC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: !isKYCVerified
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgBackgroundContainer(
                width: double.infinity,
                height: 115,
                imagePath: 'assets/icons/kyc_bg.svg',
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'To access additional account privileges.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'Kindly complete your KYC verification',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              WhiteButton(
                                text: 'Verify now',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                onPressed: verifyKYC,
                              )
                            ],
                          ),
                          Image.asset(
                            'assets/img/kyc_verify.png',
                            width: 70,
                            height: 70,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox(), // Empty widget if KYC verified
    );
  }
}

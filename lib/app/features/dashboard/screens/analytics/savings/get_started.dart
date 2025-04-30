import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics/savings/saving_container.dart';

class GetStartedWithSavings extends StatelessWidget {
  const GetStartedWithSavings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: BackWithTextHeader(
              text: '',
              icon: 'assets/icons/purple_cancel.svg',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/new_saving.png',
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 40.0),
                    const Text(
                      'Welcome to savings with realize',
                      style: TextStyle(
                          color: AppColors.primaryBlackColor2,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Lorem ipsum dolor sit amet consectetur. Vel id vitae elementum libero sed aliquet congue. Gravida accumsan sagittis cursus semper enim. Odio lacus metus feugiat et ac. Ut iaculis egestas magna porttitor suscipit tortor sem egestas. Sed ultrices consequat metus malesuada id turpis sagittis blandit ornare. Dui egestas rutrum blandit neque massa. Odio quisque aliquet egestas elit.',
                      style: TextStyle(
                          color: AppColors.primaryTabGray,
                          fontSize: 11,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: PurpleGradientButton(
                  text: 'Get started now',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SavingContainer()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

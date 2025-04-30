import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/buttons/image_with_no_text_button.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/disclaimer.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Expanded(
                    child: Text(
                      'See a total of all your money in one place. Bring all of your accounts into one view.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ImageWithNoTextButton(
                    imagePath: 'assets/icons/fi_x.svg',
                    imageSize: 20,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1,
              color: AppColors.primaryDividerGray,
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    elevation: 3,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(45, 21, 95, 0.23),
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/add_account.svg',
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text('Add account/card')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

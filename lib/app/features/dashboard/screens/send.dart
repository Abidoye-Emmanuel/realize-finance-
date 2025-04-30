import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/widgets/bg/svg_bg.dart';

class Send extends StatefulWidget {
  const Send({Key? key}) : super(key: key);

  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            OptionTile(
              title: 'Send money',
              subtitle: 'Instant Transfer',
              onPressed: () {
                //
              },
            ),
           const SizedBox(
              height: 16,
            ),
            OptionTile(
              title: 'Realize wallet',
              subtitle: 'Realize accounts / cards',
              onPressed: () {
                //
              },
            ),
           const SizedBox(
              height: 16,
            ),
            OptionTile(
              title: 'Accounts',
              subtitle: 'Available accounts',
              onPressed: () {
                //
              },
            ),
            const SizedBox(
              height: 16,
            ),
            OptionTile(
              title: 'Transaction Log',
              subtitle: 'Transaction details',
              onPressed: () {
                //
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const OptionTile({
    required this.title,
    required this.subtitle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgBackgroundContainer(
      width: double.infinity,
      height: 100,
      borderRadius: BorderRadius.circular(10),
      imagePath: 'assets/img/send_option_bg.png',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            type: MaterialType
                .transparency, // Make the Material widget transparent
            child: ListTile(
              title: Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              subtitle: Text(subtitle,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/divider.svg',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset('assets/icons/fi_arrow.svg'),
                ],
              ),
              onTap: () {
                //
              },
            ),
          ),
        ],
      ),
    );
  }
}

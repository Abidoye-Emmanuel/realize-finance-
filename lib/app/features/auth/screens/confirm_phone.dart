import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/core/modals/confirm_phone_modal.dart';
import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';
// import 'package:flutter/material.dart';
// import 'package:realize_mobile_app/app/core/constants/colors.dart';
// import 'package:realize_mobile_app/app/core/modals/confirm_phone_modal.dart';
// import 'package:realize_mobile_app/app/widgets/navs/back_with_text_header.dart';
// import 'package:realize_mobile_app/app/widgets/buttons/purple_gradient_button.dart';

// class ConfirmPhone extends StatefulWidget {
//   @override
//   createState() => _ConfirmPhoneState();
// }

// class _ConfirmPhoneState extends State<ConfirmPhone> {
//   bool _agreedToTerms = false;

//   void _submitForm() {
//     // Handle the form submission logic here
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Determine if the keyboard is open

//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Prevent the scaffold from resizing
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           elevation: 0,
//           backgroundColor: Colors.white,
//           title: Align(
//             alignment: Alignment.centerLeft,
//             child: BackWithTextHeader(text: ''),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Container(
//               color: Colors.white,
//               width: double.infinity,
//               padding: const EdgeInsets.fromLTRB(
//                   16.0, 8.0, 16.0, 80.0), // Adjusted for button
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Confirm your phone number",
//                     style: TextStyle(
//                         color: AppColors.primaryGrayColor2,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width *
//                         0.8, // 80% of screen width
//                     child: RichText(
//                       textAlign: TextAlign.left, // Center align text
//                       text: TextSpan(
//                         style: DefaultTextStyle.of(context).style.copyWith(
//                               height: 1.8,
//                             ),
//                         children: const <TextSpan>[
//                           TextSpan(
//                             text:
//                                 "Enter below the 6-digit confirmation code sent to ",
//                             style: TextStyle(
//                                 decoration: TextDecoration.none,
//                                 fontFamily: 'Montserrat',
//                                 color:
//                                     AppColors.primaryGrayColor3, // Custom color
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400
//                                 // Add other styles similar to SpanTextSmall if needed
//                                 ),
//                           ),
//                           TextSpan(
//                             text: "+234 7031123456",
//                             style: TextStyle(
//                               decoration: TextDecoration.none,
//                               fontFamily: 'Montserrat',
//                               color: AppColors
//                                   .primaryBlackColor, // Different color for the number
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 32),
//                 ],
//               ),
//             ),
//           ),
          
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
//               child: Column(
//                 children: [
//                   // Conditionally render the button based on keyboard state
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 24.0,
//                         width: 24.0,
//                         child: Checkbox(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(2.0),
//                             side: const BorderSide(
//                               width: 1.0,
//                               color: AppColors.primaryPurpleColor1,
//                             ),
//                           ),
//                           side: MaterialStateBorderSide.resolveWith(
//                             (states) {
//                               if (states.contains(MaterialState.selected)) {
//                                 return const BorderSide(
//                                   width: 1.0,
//                                   color: AppColors.primaryPurpleColor1,
//                                 );
//                               }
//                               return const BorderSide(
//                                 width: 1.0,
//                                 color: AppColors.primaryGrayColor1,
//                               );
//                             },
//                           ),
//                           fillColor: MaterialStateColor.resolveWith(
//                             (states) {
//                               return Colors.transparent;
//                             },
//                           ),
//                           checkColor: MaterialStateColor.resolveWith(
//                             (states) {
//                               if (states.contains(MaterialState.selected)) {
//                                 return Colors.white;
//                               }
//                               return AppColors.primaryPurpleColor1;
//                             },
//                           ),
//                           value: _agreedToTerms,
//                           onChanged: (value) {
//                             setState(() {
//                               _agreedToTerms = value ?? false;
//                             });
//                           },
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       Expanded(
//                         child: Wrap(
//                           crossAxisAlignment: WrapCrossAlignment.center,
//                           children: [
//                             const Text(
//                               'I agree to the Bricks & Yards ',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: AppColors.primaryGrayColor1,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {},
//                               child: const Text(
//                                 'terms of service ',
//                                 style: TextStyle(
//                                   color: AppColors.primaryPurpleColor1,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                             const Text(
//                               'and ',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: AppColors.primaryGrayColor1,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 //
//                               },
//                               child: const Text(
//                                 'privacy policy',
//                                 style: TextStyle(
//                                   color: AppColors.primaryPurpleColor1,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   PurpleGradientButton(
//                     text: 'Yes, Confirm',
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return ConfirmPhoneModal(
//                             phoneNumber: "+234 7031123456",
//                             onConfirm: () {
//                               // Execute your delete logic here
//                               print("Yes, Confirm!");
//                             },
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



class ConfirmPhone extends StatefulWidget {
  const ConfirmPhone({super.key});

  @override
  createState() => _ConfirmPhoneState();
}

class _ConfirmPhoneState extends State<ConfirmPhone> {
  bool _agreedToTerms = false;

  void _submitForm() {
    // Handle the form submission logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: BackWithTextHeader(text: ''),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Confirm your phone number",
                    style: TextStyle(
                        color: AppColors.primaryGrayColor2,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style.copyWith(
                              height: 1.8,
                            ),
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                "Enter below the 6-digit confirmation code sent to ",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Montserrat',
                                color: AppColors.primaryGrayColor3,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: "+234 7031123456",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                              color: AppColors.primaryBlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              side: const BorderSide(
                                width: 1.0,
                                color: AppColors.primaryPurpleColor1,
                              ),
                            ),
                            side: WidgetStateBorderSide.resolveWith(
                              (states) {
                                if (states.contains(WidgetState.selected)) {
                                  return const BorderSide(
                                    width: 1.0,
                                    color: AppColors.primaryPurpleColor1,
                                  );
                                }
                                return const BorderSide(
                                  width: 1.0,
                                  color: AppColors.primaryGrayColor1,
                                );
                              },
                            ),
                            fillColor: WidgetStateColor.resolveWith(
                              (states) {
                                return Colors.transparent;
                              },
                            ),
                            checkColor: WidgetStateColor.resolveWith(
                              (states) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.white;
                                }
                                return AppColors.primaryPurpleColor1;
                              },
                            ),
                            value: _agreedToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreedToTerms = value ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Text(
                                'By ticking this box, you are agreeing to Realize’s ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryGrayColor5,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'terms of service ',
                                  style: TextStyle(
                                    color: AppColors.primaryPurpleColor1,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const Text(
                                'and ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryGrayColor5,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: const Text(
                                  'privacy policy',
                                  style: TextStyle(
                                    color: AppColors.primaryPurpleColor1,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32,),
                    PurpleGradientButton(
                      text: 'Yes, Confirm',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmPhoneModal(
                              phoneNumber: "+234 7031123456",
                              onConfirm: () {
                                // Execute your delete logic here
                                print("Yes, Confirm!");
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

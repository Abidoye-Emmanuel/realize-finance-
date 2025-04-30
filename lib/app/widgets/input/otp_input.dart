import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputForm extends StatefulWidget {
  final int length;
  final Function(String) onSubmit;

  const OtpInputForm({super.key, 
    this.length = 4,
    required this.onSubmit,
  });

  @override
  _OtpInputFormState createState() => _OtpInputFormState();
}
class _OtpInputFormState extends State<OtpInputForm> {
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(widget.length, (index) => FocusNode());
    controllers = List.generate(widget.length, (index) => TextEditingController());

    focusNodes[0].requestFocus();
  }

  void handleChange(String value, int index) {
    if (RegExp(r'^\d*$').hasMatch(value) && index < widget.length) {
      controllers[index].text = value; // Set the text of the controller
      if (value.isNotEmpty && index < widget.length - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    }
  }

  // void handleKeyDown(RawKeyEvent event, int index) {
  //   if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
  //     if (controllers[index].text.isEmpty && index > 0) {
  //       FocusScope.of(context).requestFocus(focusNodes[index - 1]);
  //     }
  //   }
  // }
  void handleKeyDown(RawKeyEvent event, int index) {
  if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
    if (controllers[index].text.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      // Clear the text in the previous box
      controllers[index - 1].text = '';
    }
  }
}


  void handlePaste(ClipboardData? clipboardData) {
    final pastedText = clipboardData?.text ?? "";
    final pastedOtp = pastedText.substring(0, widget.length).split('');

    for (int i = 0; i < widget.length; i++) {
      if (i < pastedOtp.length) {
        handleChange(pastedOtp[i], i);
      } else {
        handleChange("", i); // Clear any remaining input
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.length,
            (index) => Container(
              width: 50.0,
              height: 50.0,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextFormField(
                key: ValueKey(index),
                focusNode: focusNodes[index],
                controller: controllers[index], // Use a controller for text input
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16.0),
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) => handleChange(value, index),
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onFieldSubmitted: (_) {
                  if (index == widget.length - 1) {
                    // Submit the OTP when the last input field is filled
                    widget.onSubmit(controllers.map((controller) => controller.text).join());
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
  int lastFocusedIndex = 0;
  bool isClearingProgrammatically = false;

  void handleInput(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void clearingLogic() {
    for (int i = 0; i < 6; i++) {
      focusNodes[i].addListener(() {
        if (focusNodes[i].hasFocus) {
          lastFocusedIndex = i;
        }
      });

      controllers[i].addListener(() {
        if (isClearingProgrammatically) return;

        int index = i;
        String currentText = controllers[index].text;

        if (currentText.isNotEmpty && index < 5) {
          focusNodes[index + 1].requestFocus();
        }

        // If user hits backspace on empty field
        if (currentText.isEmpty && lastFocusedIndex == index && index > 0) {
          isClearingProgrammatically = true;
          controllers[index - 1].clear();
          focusNodes[index - 1].requestFocus();
          Future.delayed(const Duration(milliseconds: 50), () {
            isClearingProgrammatically = false;
          });
        }
      });
    }
  }

  void clearAllFields() {
    for (var controller in controllers) {
      controller.clear();
    }
    focusNodes[0].requestFocus();
  }

  void disposeControllers() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
  }
}

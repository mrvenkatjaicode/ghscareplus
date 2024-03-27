import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopUpController extends GetxController {
  var checkboxValues = <bool>[false, false, false].obs;
  List<String> selectedTests = [];
  var isNextButtonEnabled = false.obs;
  final RxBool isLoading = false.obs;

  final TextEditingController emailCntrl = TextEditingController();
  final TextEditingController username = TextEditingController();
  final RxBool textfieldview = false.obs;

  void toggleCheckbox(int index, List<Map<String, dynamic>> dataList) {
    checkboxValues[index] = !checkboxValues[index];
    if (checkboxValues[index]) {
      // If checkbox is selected, add the text from the corresponding text field to the selectedTests list
      selectedTests.add(dataList[index]['testname']);
    } else {
      // If checkbox is unselected, remove the text from the corresponding text field from the selectedTests list
      selectedTests.remove(dataList[index]['testname']);
    }
    // Update the Next button state based on the selectedTests list
    updateNextButtonState();
  }

  void clearCheckboxes() {
    checkboxValues.fillRange(0, checkboxValues.length, false);
    // Clear the selectedTests list when clearing checkboxes
    selectedTests.clear();
    update();
  }

  void updateNextButtonState() {
    // Enable the Next button if selectedTests list is not empty
    isNextButtonEnabled.value = selectedTests.isNotEmpty;
  }

  Future sendEmail({
    required List<String> selectedTests,
    required String email,
    required String name,
  }) async {
    print("selectedList ${selectedTests.join(', ')}");
    print(email);
    var response = 200;

    /*  final serviceId = 'service_77kd7x8';
    final templateId = 'template_3zilz4k';
    final userId = 'gMLbR3hg0DRqtvvgw';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': name,
          'to_email': email,
          'subject': 'Test Packages',
          'message': selectedTests
              .join(', '), // Convert list to comma-separated string
          'sender_name': 'GHSCarePlus'
        }
      }),
    );
    print(response.body); */
    if (/* response.statusCode */ response == 200) {
      // Show success alert if response status code is 200

      clearCheckboxes();
      emailCntrl.clear();
      username.clear();
      Get.back();
      Get.dialog(
        AlertDialog(
          title: Text('Success'),
          content: Text('Email sent successfully!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {}
    //return response.statusCode;
  }
}

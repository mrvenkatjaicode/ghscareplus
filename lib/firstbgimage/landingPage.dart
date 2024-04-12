import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ghscareplus/commonwidget/texformfieldwidget.dart';
import 'package:ghscareplus/constants/color.dart';
import 'package:ghscareplus/constants/imageres.dart';
import 'package:ghscareplus/controller/popupcontroller.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:pretty_animated_buttons/widgets/pretty_capsule_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Map<String, dynamic>> dataList = [
    {'testname': 'Blood Group & type test'},
    {'testname': 'Blood Cultire Test'},
  ];

  /*  List<MultiSelectItem<Object?>> doctorlist = [
    'Blood Group & type test',
    'Blood Cultire Test',
    'Doctor 3',
    'Doctor 4',
    'Doctor 5',
  ]; */

  String? doctorselectedValue;

  List<String> selectedItems = [];

  List<String> items = [
    "Brazil",
    "Italia (Disabled)",
    "Tunisia",
    'Canada',
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // GIF
        SizedBox(
          // color: Colors.red,
          width: width,
          height: height * 1,
          child: Image.asset(
            'assets/images/GHS-GIF.gif',
            fit: BoxFit.cover,
            width: width,
          ),
        ),
        // Button
        Positioned(
          // textDirection: TextDirection.ltr,
          top: 180,
          left: 100,
          child: PrettyCapsuleButton(
            label: 'Get Quote'.toUpperCase(),
            labelStyle: const TextStyle(fontWeight: FontWeight.w900),
            bgColor: buttonColor,
            onPressed: () {
              _showCheckBoxDialog(context, dataList);
            },
          ),
        ),
      ],
    );

    /* Row(
      children: [
        SizedBox(
          width: width * 0.5,
          height: height * 0.8,
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              child: Row(
                children: [
                  Image.asset(
                    logoimage, // Replace with your image asset path
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GLOBAL HEALTH SOLUTIONS',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'Better care for a better life',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Precision Testing',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const Text(
                    'Superior Results:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const Text(
                    '"Experience Our Test Lab Today"',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  /*  const SizedBox(
                    height: 20.0,
                  ),
                  AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      ScaleAnimatedText('Think'),
                      ScaleAnimatedText('Build'),
                      ScaleAnimatedText('Ship'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ), */

                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Discover unparalleled precision and superior outcomes at our cutting-edge test lab. Explore today for an experience that exceeds expectations.',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showCheckBoxDialog(context, dataList);
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 60)),
                      backgroundColor: MaterialStateProperty.all(buttonColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(color: buttonColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Text(
                      'Get Quote'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Row(
          children: [
            SizedBox(
              //color: Colors.blue,
              width: width * 0.5,
              height: height * 0.8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: Lottie.asset(
                      'assets/images/animatesparklej.json', // Replace 'your_animation.json' with the actual path to your Lottie animation file
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    top: 2, // Positioned at the top
                    right: 4, // Positioned at the right
                    child: Image.asset(
                      'assets/images/isocert.png', // Replace 'your_image_asset.png' with the path to your image asset
                      width: 180, // Adjust width as needed
                      height: 60, // Adjust height as needed
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    //right: 0, // Positioned at the right
                    child: Image.asset(
                      landPageImg,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /*  SizedBox(
          //color: Colors.blue,
          width: width * 0.5,
          height: height * 0.8,
          child: Image.asset(
            landPageImg,
            fit: BoxFit.contain,
          ),
        ), */
      ],
    ); */
  }

  void _showCheckBoxDialog(
      BuildContext context, List<Map<String, dynamic>> dataList) {
    final PopUpController popupCtrl = Get.put(PopUpController());

    List<String> selectedValues = [];

    bool isHoverSelect = false;
    bool isHoverUnSelect = false;

    bool isHoverSubmit = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: IntrinsicHeight(
                child: IntrinsicWidth(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  // height: MediaQuery.of(context).size.height * 0.7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    //padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                child: Image.asset(popupimage)),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    //  color: Colors.amber,
                                    width: MediaQuery.of(context).size.width *
                                        0.235,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20.0, 70.0, 20.0, 20.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Test that we undertake',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                child: const Text(
                                                  textAlign: TextAlign.center,
                                                  'Introducing best health tests at best rates. Select a test and we will send you the package details to your inbox.',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              IntrinsicHeight(
                                                // height:
                                                //     MediaQuery.of(context).size.height *
                                                //         0.1,
                                                // width: MediaQuery.of(context).size.width *
                                                //     0.2,
                                                child: Expanded(
                                                  child: MultiSelectDialogField(
                                                    listType:
                                                        MultiSelectListType
                                                            .LIST,
                                                    checkColor: Colors.white,
                                                    dialogHeight: 300,
                                                    dialogWidth: 300,
                                                    backgroundColor:
                                                        Colors.white,
                                                    selectedColor: tealColor,
                                                    searchIcon: Icon(
                                                      Icons.search,
                                                      color: tealColor,
                                                    ),
                                                    /* chipDisplay:
                                                        MultiSelectChipDisplay.none(), */

                                                    chipDisplay:
                                                        MultiSelectChipDisplay(
                                                      // scroll: true,
                                                      // icon: const Icon(
                                                      //   Icons.done,
                                                      //   color: Colors.white,
                                                      // ),
                                                      chipColor: textColor,
                                                      textStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    searchable: true,
                                                    items: popupCtrl.testlist
                                                        .map((test) =>
                                                            MultiSelectItem(
                                                                test, test))
                                                        .toList(),
                                                    /* items: popupCtrl.labtests
                                                        .map((test) => MultiSelectItem(
                                                            test, test))
                                                        .toList(), */
                                                    cancelText: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: textColor),
                                                    ),
                                                    confirmText: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: textColor),
                                                    ),
                                                    title: Text(
                                                      "Search test",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: textColor),
                                                    ),
                                                    //selectedColor: Colors.blue,
                                                    decoration: BoxDecoration(
                                                      //color: Colors.blue.withOpacity(0.1),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  0)),
                                                      border: Border.all(
                                                        color: Colors.black,
                                                        //width: 2,
                                                      ),
                                                    ),
                                                    buttonIcon: Icon(
                                                      Icons
                                                          .arrow_drop_down_circle_sharp,
                                                      color: textColor,
                                                    ),
                                                    buttonText: const Text(
                                                      "Select test",
                                                      style: TextStyle(
                                                        //color: Colors.blue[800],
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    //barrierColor: Colors.red,
                                                    isDismissible: true,
                                                    onConfirm: (results) {
                                                      /* setState(() {
                                                        selectedValues = popupCtrl
                                                            .selectedtest
                                                            .map((test) =>
                                                                test.testname! as String)
                                                            .toList();
                                                      });
                                                      popupCtrl.selectedtest = results;
                                                      popupCtrl.selectedtestvalue.value =
                                                          "";
                                                      for (var element
                                                          in popupCtrl.selectedtest) {
                                                        popupCtrl.selectedtestvalue.value =
                                                            popupCtrl.selectedtestvalue
                                                                    .value +
                                                                "" +
                                                                element.testname;
                                                      } */
                                                    },
                                                  ),
                                                ),
                                              ),

                                              /* Obx(() =>
                                                  Text(popupCtrl.selectedtestvalue.value)), */
                                              TextBoxWidget(
                                                fontSize: 14,
                                                hintTextColor:
                                                    Colors.grey.shade500,
                                                focusedborderSide:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                                enabledBorderColor:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey,
                                                )),
                                                controller: popupCtrl.username,
                                                cursorColor: Colors.grey,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                fillColor: Colors.transparent,
                                                hintText: 'Your Name',
                                                cursorHeight: 20,
                                                fontColor: Colors.black,
                                                //maxLength: 25,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      25),
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          r'[a-zA-Z\s]+')),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextBoxWidget(
                                                fontSize: 14,
                                                hintTextColor:
                                                    Colors.grey.shade500,
                                                focusedborderSide:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                                enabledBorderColor:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey,
                                                )),
                                                controller:
                                                    popupCtrl.emailCntrl,
                                                cursorColor: Colors.grey,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                fillColor: Colors.transparent,
                                                hintText: 'Your Email',
                                                cursorHeight: 20,
                                                fontColor: Colors.black,
                                                inputFormatters: [],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextBoxWidget(
                                                fontSize: 14,
                                                hintTextColor:
                                                    Colors.grey.shade500,
                                                focusedborderSide:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.black,
                                                )),
                                                enabledBorderColor:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey,
                                                )),
                                                controller: popupCtrl.mobnoCtrl,
                                                cursorColor: Colors.grey,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                fillColor: Colors.transparent,
                                                hintText: 'Your Phone',
                                                cursorHeight: 20,
                                                fontColor: Colors.black,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      10),
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(r'[0-9]')),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              MouseRegion(
                                                onEnter: (_) {
                                                  setState(() {
                                                    isHoverSubmit = true;
                                                  });
                                                },
                                                onExit: (_) {
                                                  setState(() {
                                                    isHoverSubmit = false;
                                                  });
                                                },
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          isHoverSubmit
                                                              ? textColor
                                                              : Colors.white,
                                                      foregroundColor:
                                                          isHoverSubmit
                                                              ? Colors.white
                                                              : textColor,
                                                      side: BorderSide(
                                                          color: textColor),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0))),
                                                  onPressed: () async {
                                                    String errorMessage =
                                                        popupCtrl
                                                            .validateInputs();
                                                    if (errorMessage.isEmpty) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (BuildContext
                                                            context) {
                                                          return const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        },
                                                      );
                                                      // Fetch selected tests from the dropdown

                                                      //print(selectedTests);

                                                      // Call the controller function to fetch and print the selected tests
                                                      /*   popupCtrl.fetchAndPrintSelectedTests(
                                                          selectedTests); */
                                                      /*  List<String> animalNames = popupCtrl
                                                          .selectedAnimals2
                                                          .map((animal) => animal.name)
                                                          .toList(); */
                                                      bool emailSent =
                                                          await popupCtrl
                                                              .sendEmail(
                                                        selectedTests: [],
                                                        email: popupCtrl
                                                            .emailCntrl.text,
                                                        name: popupCtrl
                                                            .username.text,
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                      if (emailSent) {
                                                        // Display success alert
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Success'),
                                                              content: const Text(
                                                                  'Email sent successfully.'),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        popupCtrl.emailCntrl
                                                            .clear();
                                                        popupCtrl.username
                                                            .clear();
                                                        popupCtrl.mobnoCtrl
                                                            .clear();
                                                      } else {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Error'),
                                                              content: const Text(
                                                                  'Failed to send email.'),
                                                              actions: <Widget>[
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                          'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Error'),
                                                            content: Text(
                                                                errorMessage),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(),
                                                                child:
                                                                    const Text(
                                                                        'OK'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: const Text('Submit'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: CircleAvatar(
                                radius: 20,
                                child: CircleAvatar(
                                  backgroundColor: textColor,
                                  radius: 40,
                                  child: const Icon(
                                    Icons.close,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

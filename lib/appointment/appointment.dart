import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghswebsite/appointment/appointMobile.dart';
import 'package:ghswebsite/commonwidget/buttonwidget.dart';
import 'package:ghswebsite/commonwidget/datepickerwidget.dart';
import 'package:ghswebsite/commonwidget/dropdownwidget.dart';
import 'package:ghswebsite/commonwidget/texformfieldwidget.dart';
import 'package:ghswebsite/constants/color.dart';
import 'package:ghswebsite/constants/stringres.dart';
import 'package:intl/intl.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({super.key});

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  bool isSelectedDoctor = false;
  bool isSelectedDept = false;
  //bool isHovered = false;

  String? doctorselectedValue;
  String? departmentselectedValue;

  TimeOfDay timeOfDay = TimeOfDay.now();

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  List<bool> isHoveredList = List.generate(3, (index) => false);

  final List<String> departmentlist = [
    'Department 1',
    'Department 2',
    'Department 3',
    'Department 4',
    'Department 5',
  ];

  final List<String> doctorlist = [
    'Doctor 1',
    'Doctor 2',
    'Doctor 3',
    'Doctor 4',
    'Doctor 5',
  ];

  final List<Map<String, dynamic>> appointmentList = [
    {
      'skill': 'Easy Booking',
      'icon': FontAwesomeIcons.laptopMedical,
      'desc': servicedesc
    },
    {
      'skill': 'Doctors',
      'icon': FontAwesomeIcons.userDoctor,
      'desc': servicedesc
    },
    {
      'skill': 'Best Price Guarantee',
      'icon': FontAwesomeIcons.handHoldingDollar,
      'desc': servicedesc
    },
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      dateController.text = "";
      timeController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: width > 1000
          ? MediaQuery.of(context).size.height * 0.69
          : (width > 700 && width < 1000)
              ? MediaQuery.of(context).size.height * 1.04
              : MediaQuery.of(context).size.height * 1.21,
      /*  decoration: BoxDecoration(
        gradient: radiantColor,
      ), */
      child: width > 1000
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: radiantColor,
                  ),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'WE ARE HERE FOR YOU',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Book an Appointment',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBoxWidget(
                                  width: 280,
                                  fillColor: Colors.transparent,
                                  hintText: 'Your Name',
                                  cursorHeight: 25,
                                  fontColor: Colors.white,
                                ),
                                TextBoxWidget(
                                  width: 280,
                                  fillColor: Colors.transparent,
                                  hintText: 'Your Phone',
                                  cursorHeight: 25,
                                  fontColor: Colors.white,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropDownWidget(
                                  key: UniqueKey(),
                                  dropdownTxt: 'Choose Department',
                                  //departmentselectedValue,
                                  dropdownTextColor: isSelectedDept
                                      ? Colors.white
                                      : Colors.white,
                                  items: departmentlist
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      departmentselectedValue = value;
                                      isSelectedDept = true;
                                    });
                                  },
                                  value: departmentselectedValue,
                                ),
                                /*const SizedBox(
                            width: 10.0,
                          ),*/
                                DropDownWidget(
                                  key: UniqueKey(),
                                  dropdownTxt: 'Select Doctor',
                                  dropdownTextColor: Colors.white,
                                  items: doctorlist
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      //print('Selected value: $value');
                                      //dropdownTxt = '';
                                      doctorselectedValue = value;
                                      isSelectedDoctor = true;
                                    });
                                  },
                                  value: doctorselectedValue,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DateTimePicker(
                                  fontColor: Colors.white,
                                  controller: dateController,
                                  width: 280,
                                  fillColor: Colors.transparent,
                                  hintText: 'Date',
                                  showCursor: false,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      //print(pickedDate);
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                      //print(formattedDate);
                                      setState(() {
                                        dateController.text =
                                            formattedDate; //set foratted date to TextField value.
                                      });
                                    } else {
                                      //print("Date is not selected");
                                    }
                                  },
                                ),
                                DateTimePicker(
                                  fontColor: Colors.white,
                                  controller: timeController,
                                  width: 280,
                                  fillColor: Colors.transparent,
                                  hintText: 'Time',
                                  showCursor: false,
                                  onTap: () {
                                    displayTimePicker(context);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            CommonButtonWidget(
                              backgroundColor: Colors.amber,
                              borderColor: Colors.amber,
                              borderRadius: BorderRadius.circular(5.0),
                              btnText: 'Make an Appointment',
                              foregroundColor: Colors.black,
                              onPressed: () {},
                              height: 60,
                              width: 400,
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LEARN ANYTHING',
                          
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'We Offer Best Services',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                            child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: ListView.builder(
                            itemCount: appointmentList.length,
                            // Replace with the actual length of your data list
                            itemBuilder: (BuildContext context, int index) {
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (_) =>
                                    setState(() => isHoveredList[index] = true),
                                onExit: (_) => setState(
                                    () => isHoveredList[index] = false),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        gradient: isHoveredList[index]
                                            ? radiantColor
                                            : radiantwhiteColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            FaIcon(
                                              appointmentList[index]['icon'],
                                              color: isHoveredList[index]
                                                  ? Colors.white
                                                  : textColor,
                                              size: 50,
                                            ),
                                            const SizedBox(
                                              width: 20.0,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  appointmentList[index]
                                                      ['skill'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 16,
                                                    color: isHoveredList[index]
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.32,
                                                    child: Text(
                                                      appointmentList[index]
                                                          ['desc'],
                                                      style: TextStyle(
                                                        color:
                                                            isHoveredList[index]
                                                                ? Colors.white
                                                                : Colors.black,
                                                      ),
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            },
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const AppointmentMobile(),
    );
  }

  Future displayTimePicker(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: timeOfDay);
    if (time != null) {
      setState(() {
        timeController.text = "${time.hour}:${time.minute}";
      });
    }
  }
}

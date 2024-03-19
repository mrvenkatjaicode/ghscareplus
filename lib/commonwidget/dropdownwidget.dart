import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget(
      {super.key,
      required this.items,
      this.value,
      this.onChanged,
      this.dropdownTxt,
      this.dropdownTextColor});

  List<DropdownMenuItem<String>>? items;
  String? value;
  final Function(String?)? onChanged;
  final String? dropdownTxt;
  Color? dropdownTextColor;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        //barrierColor: Colors.red,
        style: TextStyle(color: Colors.white),
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                widget.dropdownTxt!,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.dropdownTextColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items,
        value: widget.value,
        onChanged: widget.onChanged,
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: width > 1000 ? 280 : null,
          padding:
              width > 1000 ? const EdgeInsets.only(left: 14, right: 14) : null,
          decoration: const BoxDecoration(
            // color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.white,
          ),
          iconSize: 30,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 220,
          width: width > 1000 ? 280 : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40,
          padding:
              width > 1000 ? const EdgeInsets.only(left: 14, right: 14) : null,
          /* selectedTextStyle: TextStyle(
    color: Colors.red, // Set the desired text color for the selected item
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ), */
        ),
      ),
    );
  }
}

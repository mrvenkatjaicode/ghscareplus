import 'package:flutter/material.dart';
import 'package:ghswebsite/about/aboutus.dart';
import 'package:ghswebsite/appointment/appointment.dart';
import 'package:ghswebsite/blogpost/blogpost.dart';
import 'package:ghswebsite/constants/color.dart';
import 'package:ghswebsite/contact/contactus.dart';
import 'package:ghswebsite/drawer/menu.dart';
import 'package:ghswebsite/finddoctor/doctors.dart';
import 'package:ghswebsite/firstbgimage/bgimage.dart';
import 'package:ghswebsite/packageavailable/pricedetails.dart';
import 'package:ghswebsite/servicegiven/services.dart';
import 'package:ghswebsite/testimonials/testimonials.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const MenuWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: radiantColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: width > 600
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavBarItem(
                    title: 'Home'.toUpperCase(),
                    onTap: () => scrollToSection(0),
                    isSelected: _currentIndex == 0,
                    onIndexChanged: () => updateIndex(0),
                  ),
                  const SizedBox(width: 20),
                  NavBarItem(
                    title: 'About'.toUpperCase(),
                    onTap: () => scrollToSection(1),
                    isSelected: _currentIndex == 1,
                    onIndexChanged: () => updateIndex(1),
                  ),
                  const SizedBox(width: 20),
                  NavBarItem(
                    title: 'Service'.toUpperCase(),
                    onTap: () => scrollToSection(2),
                    isSelected: _currentIndex == 2,
                    onIndexChanged: () => updateIndex(2),
                  ),
                  const SizedBox(width: 20),
                  NavBarItem(
                    title: 'Pricing'.toUpperCase(),
                    onTap: () => scrollToSection(3),
                    isSelected: _currentIndex == 3,
                    onIndexChanged: () => updateIndex(3),
                  ),
                  const SizedBox(width: 20),
                  NavBarItem(
                    title: 'Contact'.toUpperCase(),
                    onTap: () => scrollToSection(4),
                    isSelected: _currentIndex == 4,
                    onIndexChanged: () => updateIndex(4),
                  ),
                ],
              )
            : const SizedBox(),
        leading: width > 600
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'GHS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            : null,
        actions: [
          ElevatedButton(
            onPressed: () {
              _showCheckBoxDialog(context);
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(100, 40)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  //borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: const Text(
              'Get Quote',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: const Column(children: [
          BgImage(),
          AppointmentWidget(),
          ServiceAvailable(),
          AboutUs(),
          OurDoctors(),
          TestimonialWidget(),
          BlogPost(),
          PriceDetails(),
          ContactUs()
        ]),
      ),
    );
  }

  void scrollToSection(int sectionIndex) {
    double offset = 0;
    for (int i = 0; i < sectionIndex; i++) {
      offset += MediaQuery.of(context).size.height;
    }

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void updateIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }
}

void _showCheckBoxDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Choose Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CheckboxListTile(
              title: const Text('Option 1'),
              value: false,
              onChanged: (newValue) {
                // Handle checkbox change
              },
            ),
            CheckboxListTile(
              title: const Text('Option 2'),
              value: false,
              onChanged: (newValue) {
              },
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;
  final VoidCallback? onIndexChanged;

  const NavBarItem({
    super.key,
    required this.title,
    this.onTap,
    required this.isSelected,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
          onIndexChanged?.call();
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.amber : Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

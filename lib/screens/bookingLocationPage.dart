import 'package:flutter/material.dart';

class BookingLocationPage extends StatefulWidget {
  const BookingLocationPage({Key? key}) : super(key: key);

  @override
  State<BookingLocationPage> createState() => _BookingLocationPageState();
}

class _BookingLocationPageState extends State<BookingLocationPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _numberController = TextEditingController();

  String _currentlocation = "Colombo 1";
  List<String> locationOptions = [
    "Colombo 1",
    "Colombo 2",
    "Colombo 3",
    "Colombo 4",
  ];

  String _dLocation = "slot 1";
  List<String> reserveSlotOptions = [
    "slot 1",
    "slot 2",
    "slot 3",
    "slot 4",
  ];

  void currentlocationCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _currentlocation = selectedValue;
      });
    }
  }

  void dLocationCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dLocation = selectedValue;
      });
    }
  }


  int index = 2;
  final screens = [
    BookingLocationPage(),

  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 2,
                bottom: 2,
              ),
              child: Text(
                "Booking Location",
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 2,
                bottom: 2,
              ),
              child: Text(
                "Current Location in vehicle:",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 2,
                bottom: 2,
              ),
              child: DropdownButtonFormField(
                items: locationOptions
                    .map<DropdownMenuItem<String>>((String mascot) {
                  return DropdownMenuItem<String>(
                      child: Text(mascot), value: mascot);
                }).toList(),
                value: _currentlocation,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: currentlocationCallback,
                isExpanded: true,
                isDense: true,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 2,
                bottom: 2,
              ),
              child: Text(
                "Destination Location:",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 2,
                bottom: 2,
              ),
              child: DropdownButtonFormField(
                items: reserveSlotOptions
                    .map<DropdownMenuItem<String>>((String mascot) {
                  return DropdownMenuItem<String>(
                      child: Text(mascot), value: mascot);
                }).toList(),
                value: _dLocation,
                onChanged: dLocationCallback,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                isExpanded: true,
                isDense: true,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 300,
                right: 5,
                top: 2,
                bottom: 2,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Search'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF0D47A1),
                    textStyle: const TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

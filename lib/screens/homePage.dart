import 'package:flutter/material.dart';
import 'package:waterboard_app/screens/bookingLocationPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _numberController = TextEditingController();

  String _location = "Colombo 1";
  List<String> locationOptions = [
    "Colombo 1",
    "Colombo 2",
    "Colombo 3",
    "Colombo 4",
  ];

  String _reserveSlot = "slot 1";
  List<String> reserveSlotOptions = [
    "slot 1",
    "slot 2",
    "slot 3",
    "slot 4",
  ];

  String _bookSlot = "slot 1";
  List<String> bookSlotOptions = [
    "slot 1",
    "slot 2",
    "slot 3",
    "slot 4",
  ];

  void locationCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _location = selectedValue;
      });
    }
  }

  void reserveSlotCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _reserveSlot = selectedValue;
      });
    }
  }

  void bookSlotCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _bookSlot = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF0D47A1),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_filled),
              color: Color.fromARGB(255, 135, 195, 243),
              onPressed: () {

              },
            ),
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              color: Color.fromARGB(255, 135, 195, 243),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Color.fromARGB(255, 135, 195, 243),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            BookingLocationPage()),
                        (route) => false);
              },
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart),
              color: Color.fromARGB(255, 135, 195, 243),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0D47A1),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 32.0,
          ),
        ),
        onPressed: () {
          /*
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateEvent()),
                    );*/
        },
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 2,
                    bottom: 2,
                  ),

                  child: Text(
                    "Reservations",
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
                    "Vehicle Number:",
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
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                      controller: _numberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your vehicle number';
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    )),
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
                    "Location:",
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
                    value: _location,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: locationCallback,
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
                    "Reserve a Slot:",
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
                    value: _reserveSlot,
                    onChanged: reserveSlotCallback,
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    "Book a Slot:",
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
                    items: bookSlotOptions
                        .map<DropdownMenuItem<String>>((String mascot) {
                      return DropdownMenuItem<String>(
                          child: Text(mascot), value: mascot);
                    }).toList(),
                    value: _bookSlot,
                    onChanged: bookSlotCallback,
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
                Padding (
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
                    child: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF0D47A1),
                        textStyle: const TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}

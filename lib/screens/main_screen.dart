import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/utilities/constants.dart';
import 'package:flutter_app2/screens/sign_up_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Korepetycje',
      style: optionStyle,
    ),
    Text(
      'Kalendarz',
      style: optionStyle,
    ),
    Text(
      'Ulubione',
      style: optionStyle,
    ),
    Text(
      'Koszyk',
      style: optionStyle,
    ),
  ];

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _menuScreen() {

  }

  Widget _calendarScreen() {
    return Container(
        child: TableCalendar(


        )
    );
  }

  Widget _menuMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ogłoszenie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Kalendarz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Ulubione',
          ),
         BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Koszyk',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xFF3B3A3A),
        selectedItemColor: Color(0xFFECB6B6),
        onTap: _onItemTapped,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/tlo.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _widgetOptions.elementAt(_selectedIndex),
                      /*Text(
                        'Korepetycje',
                        style: TextStyle(
                          color: Color(0xFF393939),
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                      SizedBox(height: 30.0),
                      SizedBox(
                        height: 30.0,
                      ),
                      //_calendarScreen(),
                      //_widgetOptions.elementAt(_selectedIndex),
                    ],
                  ),

                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ogłoszenie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Kalendarz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Ulubione',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Koszyk',
          ),
        ],
        currentIndex: _selectedIndex,
        iconSize: 30,
        unselectedItemColor: Color(0xFF3B3A3A),
        selectedItemColor: Color(0xFFECB6B6),
        onTap: _onItemTapped,
      ),
    );
  }
}
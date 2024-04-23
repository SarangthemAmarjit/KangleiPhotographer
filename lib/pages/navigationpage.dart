import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kangleiphotographers/pages/categorypage.dart';
import 'package:kangleiphotographers/pages/dashboard.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavbarPage> {
  int _selectedIndex = 0;

  // Pages to be shown in the bottom navigation bar
  final List<Widget> _pages = [
    const HomePage(),
    const PageTwo(),
    const CategoryPage(),
    const PageThree(),
    const PageThree(),
  ];

  // Function to handle bottom navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: const Color.fromARGB(255, 16, 24, 40),
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            ), // sets the inactive color of the `BottomNavigat
            child: Container(margin: const EdgeInsets.only(bottom: 10),
                height: 70,
                child: Wrap(
                  children: [
                    BottomNavigationBar(type: BottomNavigationBarType.fixed,selectedIconTheme: const IconThemeData(size: 30,),

                      showUnselectedLabels: true,
                      selectedLabelStyle: const TextStyle(color: Colors.white),
                      selectedFontSize: 12,
                      unselectedFontSize: 12,
                      unselectedLabelStyle:
                          const TextStyle(color: Colors.white),
                      backgroundColor: const Color.fromARGB(255, 16, 24, 40),
                      elevation: 10,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(
                            FontAwesomeIcons.house,
                            color: Colors.white,
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            FontAwesomeIcons.book,
                            color: Colors.white,
                          ),
                          label: 'My Booking',
                        ),
                        BottomNavigationBarItem(
                          icon: CircleAvatar(backgroundColor: Colors.white,
                            radius: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Book'),
                                Text('Now'),
                              ],
                            ),
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                           FontAwesomeIcons.briefcase,
                            color: Colors.white,
                          ),
                          label: 'Portolio',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                             FontAwesomeIcons.user,
                            color: Colors.white,
                          ),
                          label: 'Profile',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: const Color.fromARGB(255, 234, 251, 105),useLegacyColorScheme: true,
                      unselectedItemColor: Colors.white,
                      onTap: _onItemTapped,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Business Page'),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('School Page'),
    );
  }
}

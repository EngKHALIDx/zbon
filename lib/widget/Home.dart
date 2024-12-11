import 'package:flutter/material.dart';
import 'package:zbon/widget/HomeScreen.dart';
import 'package:zbon/widget/profileScreen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedindex=0;
  PageController pageController=PageController();

  void onTapped(int index){
    setState(() {
      _selectedindex=index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 10,),curve: Curves.easeInOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView (
        
        controller: pageController,
        children: [
          
          HomeScreen(),
          ProfileScreen(),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const<BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "الصفحه الشخصيه",)
      ],
          currentIndex: _selectedindex,
          backgroundColor: Colors.black,
          selectedItemColor: Color.fromARGB(255, 239, 242, 240),
          unselectedItemColor: Color.fromARGB(255, 239, 242, 240),
          onTap:onTapped
      ),
    );
  }
}



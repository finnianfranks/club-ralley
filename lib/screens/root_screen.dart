import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/post_screen.dart';
import 'package:my_app/widgets/feed_page.dart';
import 'package:my_app/widgets/profile_page.dart';



class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(onDestinationSelected: (int index) {setState(() {
        currentPageIndex = index;
      },);
      },
      indicatorColor: Colors.lightGreen,
      selectedIndex: currentPageIndex,
      destinations: <Widget>[ //flagging because I removed the const in front of widget
        NavigationDestination(selectedIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: "Home"),
        NavigationDestination(icon: IconButton(icon: Icon(Icons.add_box),
         onPressed: () {
          Navigator.push(context, CupertinoPageRoute<void>(builder: (context) => PostScreen(),),);
         } ,
         ), label: "Post",),
        NavigationDestination(icon: Icon(Icons.account_circle), label: 'Profile',),
      ],
      ),
      body: <Widget>[
        FeedPage(), PostScreen(), ProfilePage(),
      ][currentPageIndex],
      
      
      appBar: AppBar(
        title: const Text('Home'),
        ), 
      );
  }
}


import 'package:flutter/material.dart';
import './FirstScreen.dart';
import './SecondScreen.dart';
import 'package:camera/camera.dart';
import './camera_page.dart';
import 'package:bottom_bar/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Drawer Demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const ({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<MyHomePage> {
  int _currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navbar"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            child: Center(
              child: Text(
                "Home Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Review Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Profile Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Setting Screen",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Kavya"),
              accountEmail: Text("kavyashah@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  "K",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xff7C4DFF),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Review"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await availableCameras().then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(
                  cameras: value,
                ),
              ),
            ),
          );
        },
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomBar(
        backgroundColor: Colors.deepPurpleAccent,
        selectedIndex: _currentPage,
        showActiveBackgroundColor: true,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
            inactiveColor: Colors.white38,
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text('Favorites'),
            inactiveColor: Colors.white38,
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text('Account'),
            activeColor: Colors.white,
            inactiveColor: Colors.white38,
          ),
          BottomBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text('Settings'),
            inactiveColor: Colors.white38,
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_flutter_app/custom_appBar/custom_appbar_screen.dart';
import 'edit_page.dart';
import 'dart:io';

class MyFilesScreen extends StatefulWidget {
  @override
  _MyFilesScreenState createState() => _MyFilesScreenState();
}

class _MyFilesScreenState extends State<MyFilesScreen> {
  final List<Map<String, String>> _items = [];
  int _selectedIndex = 0;

  void _addItem(Map<String, String> item) {
    setState(() {
      _items.add(item);
    });
  }

  void _editItem(int index, Map<String, String> item) {
    setState(() {
      _items[index] = item;
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _shareItem(Map<String, String> item) {
    final text =
        'Name: ${item['name']}\nDate: ${item['date']}\nSubject: ${item['subject']}';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
  }

  // Handle tab selection
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      // appBar: CustomAppBar(height: 200.0, scaffoldKey: _scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: const Color(0xff1760AB),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                  ),
                  Text(
                    'My File',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.search, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            color: const Color.fromARGB(255, 255, 252, 252),
            child: ListTile(
              title: Text(_items[index]['name'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Date: ${_items[index]['date']} - Subject: ${_items[index]['subject']}'),
                  if (_items[index]['image']!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.file(File(_items[index]['image']!)),
                    ),
                  if (_items[index]['document']!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('Document: ${_items[index]['document']}'),
                    ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Color(0xff1760AB),
                    ),
                    onPressed: () async {
                      final editedItem = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditPage(item: _items[index])),
                      );
                      if (editedItem != null) {
                        _editItem(index, editedItem);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color(0xff1760AB),
                    ),
                    onPressed: () {
                      _removeItem(index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Color(0xff1760AB),
                    ),
                    onPressed: () {
                      _shareItem(_items[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onTabSelected,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.contact_page),
      //       label: 'Contact',
      //     ),
      //   ],
      //   selectedItemColor: Colors.blueAccent,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   backgroundColor: Colors.white,
      //   elevation: 8,
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditPage()),
          );
          if (newItem != null) {
            _addItem(newItem);
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff1760AB),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
